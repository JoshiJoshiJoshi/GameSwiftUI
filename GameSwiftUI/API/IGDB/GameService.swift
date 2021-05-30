//
//  GameService.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import Foundation
import Combine

protocol GameServiceProtocol {
    func fetchGames(query: Query) -> AnyPublisher<[Game], Error>
}

class GameService : GameServiceProtocol {
    private var requestBuilder: RequestBuilderProtocol
    init(requestBuilder: RequestBuilderProtocol) {
        self.requestBuilder = requestBuilder
    }
    
    func fetchGames(query: Query) -> AnyPublisher<[Game], Error> {
        let urlRequest = createUrlRequest(query)
        print(urlRequest.url?.absoluteString)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: [Game].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    private func createUrlRequest(_ query: Query) -> URLRequest {
        return requestBuilder
            .setQuery(query)
            .build()
    }
}
