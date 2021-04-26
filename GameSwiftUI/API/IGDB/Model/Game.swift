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
    var firstReleaseDate: Int?
    enum CodingKeys: String, CodingKey {
        case totalRating = "total_rating"
        case firstReleaseDate = "first_release_date"
        case id, name, storyline, summary, cover
    }
    
}

struct Cover: Codable {
    var imageID: String?
    
    enum CodingKeys: String, CodingKey {
        case imageID = "image_id"
    }
}

extension Game {
    static let placeholders: [Self] = (0..<5).map {
        .init(
            id: $0,
            name: "Lorem ipsum dolor sit",
            storyline: "",
            summary: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non",
            cover: Cover(imageID: ""),
            totalRating: 69
        )
    }
}
