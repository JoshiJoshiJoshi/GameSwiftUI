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
        // Ignores alls errors completely and returns a placeholder instead
        .replaceError(with: [])
        // Expose an instance of AnyPublisher to the downstream subscriber, rather than this publisher’s actual type
        .eraseToAnyPublisher()
    }
}
