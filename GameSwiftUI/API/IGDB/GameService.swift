//
//  GameService.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import Foundation
import Combine

class GameService {
    func fetchGames(for url: URLRequest) -> AnyPublisher<[Game], Never> {
      return URLSession.shared.dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: [Game].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
    }
    
    private func createUrlRequest(_ query: Query) -> URLRequest {
        return requestBuilder
            .setQuery(query)
            .build()
    }
}
