//
//  SearchClerk.swift
//  GameSwiftUI
//
//  Created by Joshi on 24.04.21.
//

import Foundation
import Combine

protocol SearchClerkProtocol {
    func searchGames(title: String) -> AnyPublisher<[Game], Error>
}

public class SearchClerk : SearchClerkProtocol{
    private var queryBuilder: QueryBuilderProtocol
    private var gameService: GameServiceProtocol
    
    init(queryBuilder: QueryBuilderProtocol,
         requestBuilder: RequestBuilderProtocol) {
        self.queryBuilder = queryBuilder
        self.gameService = GameService(requestBuilder: requestBuilder)
    }
    
    func searchGames(title: String) -> AnyPublisher<[Game], Error> {
        let query = queryBuilder
            .search(title)
            .filter(field: RequestConstants.Game.category)
            .isEqual(value: 0)
            .build()
        
        return gameService.fetchGames(for: query)
    }
    
}
