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
}

struct Cover: Codable {
    var imageID: String?

    enum CodingKeys: String, CodingKey {
        case imageID = "image_id"
    }
}
