//
//  SearchViewModel.swift
//  GameSwiftUI
//
//  Created by Joshi on 21.04.21.
//

// Resources
// https://developer.apple.com/documentation/combine/subscriber

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
        $searchInput
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
            .receive(on: DispatchQueue.main) // q
            .assign(to: \.searchResults, on: self)
            .store(in: &subscriptions) // q
    }
    
    func searchGames(title: String) -> URLRequest {
        let query = queryBuilder
            .limit(100)
            .include(RequestConstants.Game.name,
                     RequestConstants.Game.summary,
                     RequestConstants.Game.storyline,
                     RequestConstants.Cover.imageId,
                     RequestConstants.Game.firstReleaseDate,
                     RequestConstants.Game.totalRating)
            .filter(field: RequestConstants.Game.name)
            .isEqual(string: title, prefix: true, postfix: false)
            .filter(field: RequestConstants.Game.category)
            .isEqual(value: 0)
            .sort(field: RequestConstants.Game.firstReleaseDate, order: .DESCENDING)
            .build()

        
        let searchUrl = requestBuilder
            .setBaseUrl(.INOFFICIAL)
            .setEndpoint(RequestEndpoints.games)
            .setRequestMethod(.POST)
            .setQuery(query)
            .build()
        
        return searchUrl
    }
}

