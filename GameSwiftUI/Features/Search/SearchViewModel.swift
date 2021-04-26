//
//  SearchViewModel.swift
//  GameSwiftUI
//
//  Created by Joshi on 21.04.21.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var searchInput = ""
    @Published private(set) var loadingState: CollectionLoadingState<[Game]> = .initial
    private var searchClerk: SearchClerkProtocol
    private var subscriptions: Set<AnyCancellable> = []
    private var cancellable: AnyCancellable!
    // MARK: - WIP
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
                self.searchClerk.searchGames(title: title, sortOrder: self.sortOrder)
            }
            .compactMap { games in
                // [Game] -> CollectionLoadingState<[Game]>
                games.mapToLoadingState(placeholder: Game.placeholders)
            }
            // A new Publisher output will cancel all previous subscriptions <- huge performance boost
            .switchToLatest()
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: {
                    [weak self] _ in self?.subscriptions.remove((self?.cancellable)!)
                }, receiveValue: { loadingStateGames in
                    self.loadingState = loadingStateGames
                })
        cancellable.store(in: &subscriptions)
    }
    
    // MARK: - WIP
    func getImageUrl(game: Game, imageSize: IGDBImageSize) -> URL {
        let imageID = game.cover?.imageID ?? ""
        
        return !imageID.isEmpty ? URL(string: "https://images.igdb.com/igdb/image/upload/t_\(imageSize.rawValue)/\(imageID).jpg")! : URL(fileURLWithPath: "cover.jpg")
    }
    
    // MARK: - WIP
    func formatTimestampToYear(game: Game) -> String {
        let unixTimestamp = game.firstReleaseDate ?? 0
        if unixTimestamp == 0 { return "N/A"}
        let formatter = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(game.firstReleaseDate!))
        formatter.dateFormat = "YYYY"
        return formatter.string(from: date)
    }
    
    // MARK: - WIP
    func sort() {
        guard case .loaded(let games) = loadingState else {
            return
        }
        var newGames: [Game]
        switch sortOrder {
        case .ASCENDING:
            newGames = games.sorted { (x,y) in
                x.firstReleaseDate ?? 0 < y.firstReleaseDate ?? 0
            }
            break
        case .DESCENDING:
            newGames = games.sorted { (x,y) in
                x.firstReleaseDate ?? 0 > y.firstReleaseDate ?? 0
            }
            break
        }
        loadingState = CollectionLoadingState.loaded(content: newGames)
    }
    
    // MARK: - WIP
    func sortOrderToggle() {
        switch sortOrder {
        case .ASCENDING:
            sortOrder = .DESCENDING
            break
        case .DESCENDING:
            sortOrder = .ASCENDING
            break
        }
    }
    
    // MARK: - WIP
    func sortList() {
        sortOrderToggle()
        sort()
    }
    
}

// MARK: - WIP
enum IGDBImageSize: String {
    case micro = "micro"
    case thumbnail = "thumb"
    case coverSmall = "cover_small"
    case logoMed = "logo_med"
    case coverBig = "cover_big"
    case screenshotMedium = "screenshot_med"
    case screenshotBig = "screenshot_big"
    case screenshotHuge = "screenshot_huge"
    case hd = "720p"
    case fhd = "1080p"
}
