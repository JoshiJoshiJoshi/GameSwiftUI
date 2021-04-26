//
//  NewsService.swift
//  GameSwiftUI
//
//  Created by Joshi on 26.04.21.
//

import Foundation
import Combine

protocol NewsServiceProtocol {
    func fetchNews() -> AnyPublisher<[News], Error>
}
// MARK: - WIP
class NewsService : NewsServiceProtocol {
    let url = URL(string:"http://localhost:8055/items/announcements")!
    
    func fetchNews() -> AnyPublisher<[News], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Announcement.self, decoder: JSONDecoder())
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
