//
//  QueryPreset.swift
//  GameSwiftUI
//
//  Created by Joshi on 20.04.21.
//

import Foundation

// ---------------------------------------- IGDB ---------------------------------------- //
struct Config {
    struct Query {
        static let defaultIncludedFields: [String] = [IGDBField.Game.id,
                                                      IGDBField.Game.name,
                                                      IGDBField.Cover.imageId,
                                                      IGDBField.Game.summary,
                                                      IGDBField.Game.storyline,
                                                      IGDBField.Game.firstReleaseDate,
                                                      IGDBField.Game.totalRating,
                                                      IGDBField.Genre.name,
                                                      IGDBField.InvolvedCompany.all,
                                                      IGDBField.AgeRating.category,
                                                      IGDBField.AgeRating.rating,
                                                      IGDBField.GameVideo.videoId,
                                                      IGDBField.Screenshot.imageId,
                                                      IGDBField.Platform.name,
                                                      IGDBField.GameMode.name,
                                                      IGDBField.PlayerPerspective.name,
                                                      IGDBField.Theme.name,
                                                      IGDBField.Website.category,
                                                      IGDBField.Website.url,
                                                      IGDBField.MultiplayerMode.all,
                                                      IGDBField.Game.status,
                                                      IGDBField.Game.similarGames,
                                                      IGDBField.Game.dlcs,
                                                      IGDBField.Artwork.imageId
        ]
        static var defaultLimit: Int = 100
        static let defaultOffset: Int = 0
        static let defaultExcludedFields: [String] = []
        static let defaultSortByField: SortByField = .firstReleaseDate
        static let defaultSortOrder: SortOrder = .descending
        // Not yet implemented
        static let defaultFilter: [QueryFilter] = []
        // DO NOT TOUCH.
        static let defaultSearch: String = ""
    }
    
    struct Request {
        static let defaultHttps: Bool = true
        // IGDB OAuth credentials are required for 'OFFICIAL' aka 'api.igdb.com'
        static let defaultBaseUrl: IGDBBaseUrl = .inofficial
        static let defaultEndpoint: IGDBEndpoint = .games
        static let defaultHTTPMethod: HTTPMethod = .get
    }
    
    struct Auth {
        static let defaultAuthMethod: RequestAuthMethod = .none
        struct OAuth {
            private static let clientId: String = ""
            private static let accessToken: String = ""
            static let credentials: [String : String] = ["Client-ID" : clientId, "Authorization" : "Bearer \(accessToken)"]
        }
    }
}

enum IGDBBaseUrl: String {
    case inofficial = "api.research.sx"
    case official = "api.igdb.com"
}
// ---------------------------------------- IGDB ---------------------------------------- //
