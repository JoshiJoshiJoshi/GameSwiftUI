//
//  Game.swift
//  GameSwiftUI
//
//  Created by Joshi on 18.04.21.
//

import Foundation

struct Game: Codable, Identifiable {
    var id: Int?
    var name: String?
    var storyline: String?
    var summary: String?
    var cover: Cover?
    var totalRating: Double?
    enum CodingKeys: String, CodingKey {
        case totalRating = "total_rating"
        case id, name, storyline, summary, cover
    }
    
    static let placeholders: [Self] = (0..<5).map {
        .init(
            id: $0,
            name: "Lorem ipsum dolor",
            storyline: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ",
            summary: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ",
            cover: Cover(imageID: "Lorem ipsum dolor"),
            totalRating: 100.0
        )
    }
}

struct Cover: Codable {
    var imageID: String?

    enum CodingKeys: String, CodingKey {
        case imageID = "image_id"
    }
}
