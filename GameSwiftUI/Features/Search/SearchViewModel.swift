//
//  SearchViewModel.swift
//  GameSwiftUI
//
//  Created by Joshi on 21.04.21.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    var gameService = GameService(requestBuilder: RequestBuilder())
    @Published var searchInput = ""
    @Published private(set) var loadingState: CollectionLoadingState<[Game]> = .initial
    private var searchClerk: SearchClerkProtocol
    private var subscriptions: Set<AnyCancellable> = []
    private var cancellable: AnyCancellable!
    // MARK: - WIP
    private var sortByField: SortByField = Config.Query.defaultSortByField
    private var sortOrder: SortOrder = Config.Query.defaultSortOrder
    init(searchClerk: SearchClerkProtocol,
         scheduler: DispatchQueue = DispatchQueue(label: "SearchViewModel")
    ) {
        self.searchClerk = searchClerk
        cancellable = $searchInput
            .dropFirst(2)
            // The first emitted value is an empty string, we will skip it to prevent unintended network calls
            .filter {
                $0.count >= 2
            }
            // Waits 400ms until the user stops typing and then emit the value
            .debounce(for: .milliseconds(400), scheduler: scheduler)
            // Publishes only elements that don’t match the previous element.
            .removeDuplicates()
            .compactMap { title in
                self.searchClerk.searchGames(title: title, sortByField: self.sortByField, sortOrder: self.sortOrder, offset: 0)
            }
            .compactMap { games in
                // [Game] -> CollectionLoadingState<[Game]>
                games.mapToLoadingState(placeholder: Game.placeholders)
            }
            // A new Publisher output will cancel all previous subscriptions <- huge performance boost
            .switchToLatest()
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { [weak self] _ in self?.subscriptions.remove((self?.cancellable)!)
                }, receiveValue: { loadingStateGames in
                    self.loadingState = loadingStateGames
                    self.sort()
                })
        cancellable.store(in: &subscriptions)
    }
    
    // MARK: - WIP
    func getImageUrl(game: Game, imageSize: IGDBImageSize, retina: Bool = false) -> URL {
        return IGDBImage.shared.createImageUrl(game: game, imageSize: imageSize, retina: retina) ?? Bundle.main.url(forResource: "not-found", withExtension: "png")!
    }
    

    // MARK: - WIP
    func sort() {
        guard case .loaded(let games) = loadingState else {
            return
        }
        var sortedGames: [Game]
        
        switch sortOrder {
        case .ascending:
            switch sortByField {
            case .gameId:
                sortedGames = games.sorted { (x,y) in
                    x.id < y.id
                }
                break
            case .totalRating:
                sortedGames = games.sorted { (x,y) in
                    x.totalRating ?? 0 < y.totalRating ?? 0
                }
                break
            case .firstReleaseDate:
                sortedGames = games.sorted { (x,y) in
                    x.firstReleaseDate ?? 0 < y.firstReleaseDate ?? 0
                }
                break
            case .name:
                sortedGames = games.sorted { (x,y) in
                    x.name < y.name
                }
                break
            case .hypes:
                sortedGames = games.sorted { (x,y) in
                    x.name < y.name
                }
                break
            }
        case .descending:
            switch sortByField {
            case .gameId:
                sortedGames = games.sorted { (x,y) in
                    x.id > y.id
                }
                break
            case .totalRating:
                sortedGames = games.sorted { (x,y) in
                    x.totalRating ?? 0 > y.totalRating ?? 0
                }
                break
            case .firstReleaseDate:
                sortedGames = games.sorted { (x,y) in
                    x.firstReleaseDate ?? 0 > y.firstReleaseDate ?? 0
                }
                break
            case .name:
                sortedGames = games.sorted { (x,y) in
                    x.name > y.name
                }
                break
            case .hypes:
                sortedGames = games.sorted { (x,y) in
                    x.name < y.name
                }
                break
            }
        }
        loadingState = CollectionLoadingState.loaded(content: sortedGames)
    }
    
    
    
    // MARK: - WIP
    func toggleSortOrder() {
        switch sortOrder {
        case .ascending:
            sortOrder = .descending
            break
        case .descending:
            sortOrder = .ascending
            break
        }
    }
    
    // MARK: - WIP
    func sortList() {
        toggleSortOrder()
        sort()
    }
    
}
