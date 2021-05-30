//
//  Game.swift
//  GameSwiftUI
//
//  Created by Joshi on 18.04.21.
//

import Foundation

struct Game: Codable, Identifiable {
    var id: Int
    var cover: Cover?
    var firstReleaseDate: Int?
    var gameModes: [GameMode]?
    var genres: [Genre]?
    var name: String
    var platforms: [Platform]?
    var screenshots: [Screenshot]?
    var similarGames: [Int]?
    var status: Int?
    var summary: String?
    var themes: [Theme]?
    var websites: [Website]?
    var involvedCompanies: [InvolvedCompany]?
    var playerPerspectives: [PlayerPerspective]?
    var totalRating: Double?
    var videos: [Video]?
    var ageRatings: [AgeRating]?
    var storyline: String?
    var artworks: [Artwork]?
    var multiplayerModes: [MultiplayerMode]?
    
    enum CodingKeys: String, CodingKey {
        case id, cover
        case firstReleaseDate = "first_release_date"
        case gameModes = "game_modes"
        case genres, name, platforms, screenshots
        case similarGames = "similar_games"
        case status, summary, themes, websites
        case involvedCompanies = "involved_companies"
        case playerPerspectives = "player_perspectives"
        case totalRating = "total_rating"
        case videos
        case ageRatings = "age_ratings"
        case storyline, artworks
        case multiplayerModes = "multiplayer_modes"
    }
}

struct AgeRating: Codable, Identifiable {
    var id, category, rating: Int?
}

struct Genre: Codable, Identifiable {
    var id: Int?
    var name: String?
}

struct Platform: Codable, Identifiable {
    var id: Int?
    var name: String?
}

struct Theme: Codable, Identifiable {
    var id: Int?
    var name: String?
}

struct PlayerPerspective: Codable, Identifiable {
    var id: Int?
    var name: String?
}

struct Cover: Codable, Identifiable {
    var id: Int
    var imageID: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageID = "image_id"
    }
}

struct Screenshot: Codable, Identifiable {
    var id: Int?
    var imageID: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageID = "image_id"
    }
}

struct Artwork: Codable, Identifiable {
    var id: Int?
    var imageID: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageID = "image_id"
    }
}


struct GameMode: Codable, Identifiable {
    var id: Int?
    var name: String?
}

struct InvolvedCompany: Codable, Identifiable {
    var id, company, createdAt: Int?
    var developer: Bool?
    var game: Int?
    var porting, publisher, supporting: Bool?
    var updatedAt: Int?
    var checksum: String?
    
    enum CodingKeys: String, CodingKey {
        case id, company
        case createdAt = "created_at"
        case developer, game, porting, publisher, supporting
        case updatedAt = "updated_at"
        case checksum
    }
}

// MARK: - MultiplayerMode
struct MultiplayerMode: Codable, Identifiable {
    var id: Int?
    var campaigncoop, dropin: Bool?
    var game: Int?
    var lancoop, offlinecoop, onlinecoop: Bool?
    var platform: Int?
    var splitscreen: Bool?
    var checksum: String?
    var offlinemax, offlinecoopmax, onlinecoopmax, onlinemax: Int?
}

struct Video: Codable, Identifiable {
    var id: Int?
    var videoID: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case videoID = "video_id"
    }
}

struct Website: Codable, Identifiable {
    var id, category: Int?
    var url: String?
}

extension Game {
    static let placeholders: [Self] = (0..<10).map {
        .init(
            id: $0,
            cover: Cover(id: $0, imageID: ""),
            genres: [Genre(id: $0, name: "")], name: "Lorem ipsum dolor sit",
            summary:
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non ed diam non",
            totalRating: 69,
            storyline:
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam non ed diam non"
        )
    }
    
    var firstReleaseDateAsYearString: String {
        get {
            guard self.firstReleaseDate != nil else { return "N/A" }
            let date = Date(timeIntervalSince1970: TimeInterval(self.firstReleaseDate!))
            return DateFormatter.shared.year.string(from: date)        }
    }
    
    var firstReleaseDateAsString: String {
        get {
            guard self.firstReleaseDate != nil else { return "N/A" }
            let date = Date(timeIntervalSince1970: TimeInterval(self.firstReleaseDate!))
            return DateFormatter.shared.date.string(from: date)
        }
    }
    
    var totalRatingAsString: String {
        get {
            guard self.totalRating != nil else { return "N/A" }
            return "\(self.totalRating!.rounded())"
        }
    }
}

