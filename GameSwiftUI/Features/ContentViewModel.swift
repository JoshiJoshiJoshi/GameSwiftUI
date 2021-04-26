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
    
    let newsViewModel: NewsViewModel
    let newsClerk: NewsClerkProtocol
    let newsService: NewsServiceProtocol
    
    let detailViewModel: GameDetailViewModel
    
    init() {
        self.queryBuilder = QueryBuilder()
        self.requestBuilder = RequestBuilder()
        self.gameService = GameService(requestBuilder: self.requestBuilder)
        self.searchClerk = SearchClerk(queryBuilder: queryBuilder, gameService: self.gameService)
        self.searchViewModel = SearchViewModel(searchClerk: self.searchClerk)
        self.newsService = NewsService()
        self.newsClerk = NewsClerk(newsService: self.newsService)
        self.newsViewModel = NewsViewModel(newsClerk: self.newsClerk)
        
        self.detailViewModel = GameDetailViewModel()
    }
}
