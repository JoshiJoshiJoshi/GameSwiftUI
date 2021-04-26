//
//  QueryBuilder.swift
//  GameSwiftUI
//
//  Created by Joshi on 18.04.21.
//

import Foundation

protocol QueryBuilderProtocol {
    func limit(_ value: Int) -> QueryBuilderProtocol
    func offset(_ value: Int) -> QueryBuilderProtocol
    func include(_ field: String...) -> QueryBuilderProtocol
    func include(_ fields: [String]) -> QueryBuilderProtocol
    func exclude(_ field: String...) -> QueryBuilderProtocol
    func exclude(_ fields: [String]) -> QueryBuilderProtocol
    func sort(field: String, order: SortOrder) -> QueryBuilderProtocol
    func `where`(field: String) -> QueryFilterProtocol
    func search(_ query: String) -> QueryBuilderProtocol
    func build() -> Query
}

class QueryBuilder : QueryBuilderProtocol {
    private var limit: Int = Config.Query.defaultLimit
    private var offset: Int = Config.Query.defaultOffset
    private var includedFields: Set<String> = Set(Config.Query.defaultIncludedFields)
    private var excludedFields: Set<String> = Set(Config.Query.defaultExcludedFields)
    private var `where`: [QueryFilter] = Config.Query.defaultFilter
    private var search: String = Config.Query.defaultSearch
    private var sort: String = Config.Query.defaultSortField
    private var sortOrder: SortOrder = Config.Query.defaultSortOrder
    private var queryForGET: [URLQueryItem] = []
    private var queryForPOST: String = ""
    
    /// Sets the maximum number of entries to return per call.
    func limit(_ value: Int) -> QueryBuilderProtocol {
        limit = value
        return self
    }
    
    private func buildLimitQuery() throws {
        guard limit > 0 else {
            throw QueryError.invalidInput("Limit value cannot be less than 1.")
        }
        guard limit <= 500 else {
            throw QueryError.invalidInput("Limit value cannot exceed 500.")
        }
        queryForGET.append(URLQueryItem(name: "limit", value: "\(limit)"))
        queryForPOST += "limit " + String(limit) + ";"
    }
    
    /// By specifying offset, you retrieve entries starting with the offset value.
    func offset(_ value: Int) -> QueryBuilderProtocol {
        self.offset = value
        return self
    }
    
    private func buildOffsetQuery() throws {
        guard offset >= 0 else {
            throw QueryError.invalidInput("Offset value cannot be less than 0.")
        }
        queryForGET.append(URLQueryItem(name: "offset", value: "\(offset)"))
        queryForPOST += "offset " + String(offset) + ";"
    }
    
    /// Will return
    /// - Parameters:
    ///     - field: It's best to increment it with the specified limit value each time.
    func include(_ field: String...) -> QueryBuilderProtocol {
        field.forEach { item in
            includedFields.insert(item)
        }
        return self
    }
    
    func include(_ fields: [String]) -> QueryBuilderProtocol {
        fields.forEach { item in
            includedFields.insert(item)
        }
        return self
    }
    
    private func buildIncludeQuery() throws {
        guard !(includedFields.filter({ !($0 == "") }).isEmpty) else {
            throw QueryError.invalidInput("Included field parameters cannot be empty.")
        }
        queryForGET.append(URLQueryItem(name: "fields", value: includedFields.joined(separator: ",")))
        queryForPOST += "fields " + includedFields.joined(separator: ",") + ";"
    }
    
    
    func exclude(_ field: String...) -> QueryBuilderProtocol {
        field.forEach { item in
            excludedFields.insert(item)
        }
        return self
    }
    
    func exclude(_ fields: [String]) -> QueryBuilderProtocol {
        fields.forEach { item in
            excludedFields.insert(item)
        }
        return self
    }
    
    private func buildExcludeQuery() {
        queryForGET.append(URLQueryItem(name: "exclude", value: excludedFields.joined(separator: ",")))
        queryForPOST += "exclude " + excludedFields.joined(separator: ",") + ";"
    }
    
    /// Retrieve the entries sorted by the parameters specified.
    func sort(field: String, order: SortOrder) -> QueryBuilderProtocol {
        self.sort = field
        self.sortOrder = order
        return self
    }
    
    private func buildSortQuery() {
        queryForGET.append(URLQueryItem(name: "order", value: "\(sort):\(sortOrder.rawValue)"))
        queryForPOST += "sort " + "\(sort) \(sortOrder.rawValue)" + ";"
    }
    
    ///
    func `where`(field: String) -> QueryFilterProtocol {
        let queryFilter = QueryFilter(field: field, queryBuilder: self)
        `where`.append(queryFilter)
        return queryFilter
    }
    
    private func buildWhereQuery() {
        var temp: [String] = []
        `where`.forEach { item in
            queryForGET.append(URLQueryItem(name: "filter\(item.queryForGET.0)", value: "\(item.queryForGET.1)"))
            temp.append(item.queryForPOST)
        }
        queryForPOST += "where \(temp.joined(separator: "&"));"
    }
    
    /// 
    func search(_ query: String) -> QueryBuilderProtocol {
        self.search = query
        return self
    }
    
    private func buildSearchQuery() {
        _ = `where`(field: RequestConstants.Game.name).isEqual(string: search, prefix: true, postfix: false)
    }
    
    private func setDefault() {
        limit = Config.Query.defaultLimit
        offset = Config.Query.defaultOffset
        includedFields = Set(Config.Query.defaultIncludedFields)
        excludedFields = Set(Config.Query.defaultExcludedFields)
        search = Config.Query.defaultSearch
        sort = Config.Query.defaultSortField
        sortOrder = Config.Query.defaultSortOrder
        `where` = Config.Query.defaultFilter
    
        queryForGET = []
        queryForPOST = ""
    }
    
    func build() -> Query {
        do {
            try buildIncludeQuery()
            try buildLimitQuery()
            if (offset != 0) { try buildOffsetQuery() }
            if (!excludedFields.isEmpty) { buildExcludeQuery() }
            if (!search.isEmpty) { buildSearchQuery() }
            if (!`where`.isEmpty) { buildWhereQuery() }
            if (!sort.isEmpty) { buildSortQuery() }
        }
        catch QueryError.invalidInput(let msg){ fatalError(msg) }
        catch { fatalError("Unknown error occurred.") }
        
        let query = Query(queryForGET: queryForGET, queryForPOST: queryForPOST)
        setDefault()
        return query
    }
}

enum SortOrder: String {
    case ASCENDING = "asc", DESCENDING = "desc"
}

fileprivate enum QueryError: Error {
    case invalidInput(String)
}

class Query {
    let queryForGET: [URLQueryItem]
    let queryForPOST: String
    
    init(queryForGET: [URLQueryItem], queryForPOST: String) {
        self.queryForGET = queryForGET
        self.queryForPOST = queryForPOST
    }
}


