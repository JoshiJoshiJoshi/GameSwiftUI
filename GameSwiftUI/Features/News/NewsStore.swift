//
//  NewsStore.swift
//  GameSwiftUI
//
//  Created by Joshi on 20.04.21.
//

import Foundation
import Combine

class NewsQuery : ObservableObject {
    let url = URL(string:"http://localhost:8055/items/announcements")!
    var subscriptions: Set<AnyCancellable> = []
    private var cancellable: AnyCancellable?
    @Published var newsItem : [DataElement] = []
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Announcement.self, decoder: JSONDecoder())
            .map { $0.data }
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { item in
                self.newsItem.append(contentsOf: item)
            })
    }
}
