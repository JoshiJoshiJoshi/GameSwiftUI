//
//  QueryPreset.swift
//  GameSwiftUI
//
//  Created by Joshi on 20.04.21.
//

import Foundation

// ---------------------------------------- IGDB ---------------------------------------- //
struct QueryPreset {
    static let defaultIncludedFields: [String] = [RequestConstants.Game.name,
                                                  RequestConstants.Cover.imageId,
                                                  RequestConstants.Game.summary,
                                                  RequestConstants.Game.storyline,
                                                  RequestConstants.Game.firstReleaseDate,
                                                  RequestConstants.Game.totalRating]
    static let defaultLimit: Int = 60
    static let defaultOffset: Int = 0
    static let defaultExcludedFields : [String] = []
    static let defaultSortField: String = RequestConstants.Game.firstReleaseDate
    static let defaultSortOrder: SortOrder = .DESCENDING
    // Not yet implemented
    static let defaultFilter: [QueryFilter] = []
    // DO NOT TOUCH.
    static let defaultSearch: String = ""
}

struct RequestPreset {
    static let defaultHttps: Bool = true
    static let defaultBaseUrl: String = RequestBaseUrl.INOFFICIAL.rawValue
    static let defaultEndpoint: String = RequestEndpoints.games
    static let defaultRequestMethod: RequestMethod = .GET
}

enum RequestBaseUrl: String {
    case INOFFICIAL = "api.research.sx"
    case OFFICIAL = "api.igdb.com"
}

struct IGDBConfig {
    static let currentApiVersion: String = "v4"    
}
// ---------------------------------------- IGDB ---------------------------------------- //
