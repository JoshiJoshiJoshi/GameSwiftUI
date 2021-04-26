//
//  NewsDTO.swift
//  GameSwiftUI
//
//  Created by Joshi on 20.04.21.
//

import Foundation

struct Announcement: Codable {
    var data: [DataElement]
}
typealias News = DataElement

struct DataElement: Codable, Identifiable {
    var id: Int
    var dateCreated: String
    var dateUpdated: String?
    var datePublished, title, description, cover: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case datePublished = "date_published"
        case title
        case description = "description"
        case cover
    }
}

extension News {
    static let placeholders: [Self] = (0..<3).map {
        .init(id: $0,
              dateCreated: "",
              dateUpdated: "",
              datePublished: "",
              title: "Lorem ipsum dolor ",
              description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non Lorem ipsum dolor sit amet, consetetur sadipscing elitr, Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non",
              cover: "")
    }
}

