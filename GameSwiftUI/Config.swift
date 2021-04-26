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
        static let defaultIncludedFields: [String] = [RequestConstants.Game.name,
                                                      RequestConstants.Cover.imageId,
                                                      RequestConstants.Game.summary,
                                                      RequestConstants.Game.storyline,
                                                      RequestConstants.Game.firstReleaseDate,
                                                      RequestConstants.Game.totalRating]
        static let defaultLimit: Int = 100
        static let defaultOffset: Int = 0
        static let defaultExcludedFields: [String] = []
        static let defaultSortField: String = RequestConstants.Game.firstReleaseDate
        static let defaultSortOrder: SortOrder = .DESCENDING
        // Not yet implemented
        static let defaultFilter: [QueryFilter] = []
        // DO NOT TOUCH.
        static let defaultSearch: String = ""
    }
    
    struct Request {
        static let defaultHttps: Bool = true
        // IGDB OAuth credentials are required for 'OFFICIAL'
        static let defaultBaseUrl: String = RequestBaseUrl.INOFFICIAL.rawValue
        static let defaultEndpoint: String = RequestEndpoints.games
        static let defaultHTTPMethod: HTTPMethod = .GET
    }
    
    struct IGDB {
        static let currentApiVersion: String = "v4"
    }
    
    struct Auth {
        static let defaultAuthMethod: RequestAuthMethod = .OAUTH
        struct OAuth {
            private static let clientId: String = ""
            private static let accessToken: String = ""
            static let credentials: [String : String] = ["Client-ID" : clientId, "Authorization" : "Bearer \(accessToken)"]
        }
    }
}

enum RequestBaseUrl: String {
    case INOFFICIAL = "api.research.sx"
    case OFFICIAL = "api.igdb.com"
}
// ---------------------------------------- IGDB ---------------------------------------- //
