//
//  SearchClerk.swift
//  GameSwiftUI
//
//  Created by Joshi on 24.04.21.
//

import Foundation
import Combine

protocol SearchClerkProtocol {
    func searchGames(title: String, sortOrder: SortOrder) -> AnyPublisher<[Game], Error>
}

public class SearchClerk : SearchClerkProtocol {
    private var queryBuilder: QueryBuilderProtocol
    private var gameService: GameServiceProtocol
    init(queryBuilder: QueryBuilderProtocol,
         gameService: GameServiceProtocol) {
        self.queryBuilder = queryBuilder
        self.gameService = gameService
    }
    
    func searchGames(title: String, sortOrder: SortOrder) -> AnyPublisher<[Game], Error> {
        let query = queryBuilder
            .search(title)
            .offset(0)
            .where(field: RequestConstants.Game.category)
            .isEqual(value: 0)
            .where(field: RequestConstants.Game.versionParent)
            .isNull()
            .where(field: RequestConstants.Game.parentGame)
            .isNull()
            .where(field: RequestConstants.Game.versionTitle)
            .isNull()
            .sort(field: RequestConstants.Game.firstReleaseDate, order: sortOrder)
            .build()
        
        return gameService.fetchGames(query: query)
    }
}
