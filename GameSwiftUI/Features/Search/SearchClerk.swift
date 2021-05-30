//
//  SearchClerk.swift
//  GameSwiftUI
//
//  Created by Joshi on 24.04.21.
//

import Foundation
import Combine

protocol SearchClerkProtocol {
    func searchGames(title: String, sortByField: SortByField, sortOrder: SortOrder, offset: Int) -> AnyPublisher<[Game], Error>
}

public class SearchClerk : SearchClerkProtocol {
    private var queryBuilder: QueryBuilderProtocol
    private var gameService: GameServiceProtocol
    init(queryBuilder: QueryBuilderProtocol,
         gameService: GameServiceProtocol) {
        self.queryBuilder = queryBuilder
        self.gameService = gameService
    }
    
    func searchGames(title: String, sortByField: SortByField, sortOrder: SortOrder, offset: Int) -> AnyPublisher<[Game], Error> {
        let query = queryBuilder
            .search(title)
            .offset(offset)
            .where(field: IGDBField.Game.category)
            .isEqual(value: 0)
            .where(field: IGDBField.Game.versionParent)
            .isNull()
            .where(field: IGDBField.Game.parentGame)
            .isNull()
            .where(field: IGDBField.Game.versionTitle)
            .isNull()
            .sort(field: sortByField, order: sortOrder)
            .build()
        
        return gameService.fetchGames(query: query)
    }
    
    
}
