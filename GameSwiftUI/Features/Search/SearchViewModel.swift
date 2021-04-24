//
//  SearchViewModel.swift
//  GameSwiftUI
//
//  Created by Joshi on 21.04.21.
//

import Foundation
import Combine

class SearchViewModel : ObservableObject {
    @Published var searchInput = ""
    @Published var searchResults: [Game] = []
    private var subscriptions: Set<AnyCancellable> = []
    private var queryBuilder: QueryBuilderProtocol
    private var requestBuilder: RequestBuilderProtocol
    
    init(queryBuilder: QueryBuilderProtocol,
         requestBuilder: RequestBuilderProtocol,
         gameService: GameService,
         scheduler: DispatchQueue = DispatchQueue(label: "SearchViewModel")
    ) {
        self.queryBuilder = queryBuilder
        self.requestBuilder = requestBuilder
        var cancellable : AnyCancellable!
        cancellable = $searchInput
            // The first emitted value is an empty string, we will skip it to prevent unintended network calls
            .dropFirst(1)
            // Waits 400ms until the user stops typing and then emit the value
            .debounce(for: .milliseconds(400), scheduler: scheduler)
            // Publishes only elements that don’t match the previous element.
            .removeDuplicates()
            .compactMap { title in
                self.searchGames(title: title)
            }
            .flatMap {
                gameService.fetchGames(for: $0)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] _ in self?.subscriptions.remove(cancellable)
            }, receiveValue: { games in
                self.searchResults = games
            })

        cancellable.store(in: &subscriptions)
    }
    
    func searchGames(title: String) -> URLRequest {
        let query = queryBuilder
            .search(title)
            .filter(field: RequestConstants.Game.category)
            .isEqual(value: 0)
            .build()
        
        let searchUrl = requestBuilder
            .setQuery(query)
            .build()

        return searchUrl
    }
}

