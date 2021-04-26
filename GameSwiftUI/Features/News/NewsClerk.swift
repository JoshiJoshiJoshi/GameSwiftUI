//
//  NewsClerk.swift
//  GameSwiftUI
//
//  Created by Joshi on 26.04.21.
//

import Foundation
import Combine

protocol NewsClerkProtocol {
    func getNews() -> AnyPublisher<[News], Error>
}

public class NewsClerk: NewsClerkProtocol {
    private var newsService: NewsServiceProtocol
    
    init(newsService: NewsServiceProtocol) {
        self.newsService = newsService
    }
    
    func getNews() -> AnyPublisher<[News], Error>{
        return newsService.fetchNews()
    }
}
