//
//  NewsViewModel.swift
//  GameSwiftUI
//
//  Created by Joshi on 25.04.21.
//

import Foundation
import Combine

final class NewsViewModel: ObservableObject {
    @Published private(set) var loadingState: CollectionLoadingState<[News]> = .initial
//        @Published private(set) var loadingState: CollectionLoadingState<[News]> = .loading(placeholder: News.placeholders)
    private var subscriptions: Set<AnyCancellable> = []
    private var cancellable: AnyCancellable?
    private var newsClerk: NewsClerkProtocol
    
    init(newsClerk: NewsClerkProtocol) {
        self.newsClerk = newsClerk
        self.getNews()
    }
    
    // MARK: - WIP
    func getNews() {
        cancellable = newsClerk.getNews()
            .mapToLoadingState(placeholder: News.placeholders)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
                [weak self] _ in self?.subscriptions.remove((self?.cancellable)!)
            }, receiveValue: { loadingStateNews in
                self.loadingState = loadingStateNews
            })
    }
    
    // MARK: - WIP
    func getMediaUrl(news: News) -> URL {
        return URL(string: "http://localhost:8055/assets/\(news.cover)")!
    }
}
