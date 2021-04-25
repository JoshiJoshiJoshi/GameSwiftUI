//
//  ContentViewModel.swift
//  GameSwiftUI
//
//  Created by Joshi on 25.04.21.
//

import Foundation

final class ContentViewModel: ObservableObject {
    let queryBuilder: QueryBuilderProtocol
    let requestBuilder: RequestBuilderProtocol
    let gameService: GameServiceProtocol
    let searchClerk: SearchClerkProtocol
    let searchViewModel: SearchViewModel
    let detailViewModel: GameDetailViewModel
    let newsViewModel: NewsViewModel
    
    init() {
        self.queryBuilder = QueryBuilder()
        self.requestBuilder = RequestBuilder()
        self.gameService = GameService(requestBuilder: requestBuilder)
        self.searchClerk = SearchClerk(queryBuilder: queryBuilder, gameService: gameService)
        self.searchViewModel = SearchViewModel(searchClerk: searchClerk)
        self.detailViewModel = GameDetailViewModel()
        self.newsViewModel = NewsViewModel()
    }
}
