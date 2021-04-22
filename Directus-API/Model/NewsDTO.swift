//
//  NewsDTO.swift
//  GameSwiftUI
//
//  Created by Joshi on 20.04.21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? newJSONDecoder().decode(News.self, from: jsonData)

import Foundation

struct Announcement: Codable {
    var data: [DataElement]
}

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
