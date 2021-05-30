//
//  QueryBuildDirector.swift
//  GameSwiftUI
//
//  Created by Joshi on 26.04.21.
//

import Foundation

public class QueryBuildDirector {
    
    static var makeMostAnticipatedGamesQuery: QueryBuilderProtocol {
        get {
            let query = QueryBuilder()
                .where(field: IGDBField.Game.category)
                .isEqual(value: 0)
                .where(field: IGDBField.Game.versionParent)
                .isNull()
                .where(field: IGDBField.Game.parentGame)
                .isNull()
                .where(field: IGDBField.Game.versionTitle)
                .isNull()
                .sort(field: .hypes, order: .descending)
            
            return query
        }
    }
    
    static var makeRecentlyReleasedGamesQuery: QueryBuilderProtocol {
        get {
            let unixTime = NSDate().timeIntervalSince1970
            let query = QueryBuilder()
                .where(field: IGDBField.Game.category)
                .isEqual(value: 0)
                .where(field: IGDBField.Game.versionParent)
                .isNull()
                .where(field: IGDBField.Game.parentGame)
                .isNull()
                .where(field: IGDBField.Game.versionTitle)
                .isNull()
                .where(field: IGDBField.Game.firstReleaseDate)
                .isLessOrEqual(value: Int(unixTime))
                .sort(field: .firstReleaseDate, order: .descending)
            
            return query
        }
    }
    
    static var makeUpcomingGamesQuery: QueryBuilderProtocol {
        get {
            let unixTime = NSDate().timeIntervalSince1970
            let query = QueryBuilder()
                .where(field: IGDBField.Game.category)
                .isEqual(value: 0)
                .where(field: IGDBField.Game.versionParent)
                .isNull()
                .where(field: IGDBField.Game.parentGame)
                .isNull()
                .where(field: IGDBField.Game.versionTitle)
                .isNull()
                .where(field: IGDBField.Game.firstReleaseDate)
                .isGreaterThan(value: Int(unixTime))
                .sort(field: .firstReleaseDate, order: .ascending)

            return query
        }
    }
    
    static var makeTrendingGamesQuery: QueryBuilderProtocol {
        get {
            let query = QueryBuilder()
                .where(field: IGDBField.Game.category)
                .isEqual(value: 0)
                .where(field: IGDBField.Game.versionParent)
                .isNull()
                .where(field: IGDBField.Game.parentGame)
                .isNull()
                .where(field: IGDBField.Game.versionTitle)
                .isNull()
            
            return query
        }
    }
}
