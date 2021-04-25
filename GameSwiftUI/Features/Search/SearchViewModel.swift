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
    
    init(searchClerk: SearchClerkProtocol,
         scheduler: DispatchQueue = DispatchQueue(label: "SearchViewModel")
    ) {
        self.searchClerk = searchClerk
        var cancellable: AnyCancellable!
        cancellable = $searchInput
            // The first emitted value is an empty string, we will skip it to prevent unintended network calls
            .dropFirst(2)
            .filter {
                $0.count >= 2
            }
            // Waits 400ms until the user stops typing and then emit the value
            .debounce(for: .milliseconds(400), scheduler: scheduler)
            // Publishes only elements that don’t match the previous element.
            .removeDuplicates()
            .compactMap { title in
                self.searchClerk.searchGames(title: title)
            }
            .compactMap { games in
                games.mapToLoadingState(placeholder: Game.placeholders)
            }
            // A new Publisher output will cancel all previous subscriptions <- huge performance boost
            .switchToLatest()
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: {
                    [weak self] _ in self?.subscriptions.remove(cancellable)
                }, receiveValue: { games in
                    self.loadingState = games
                })
        cancellable.store(in: &subscriptions)
    }
}

