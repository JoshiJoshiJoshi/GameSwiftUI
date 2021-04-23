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
    func filter(field: String) -> QueryFilterProtocol
    func search(_ query: String) -> QueryBuilderProtocol
    func build() -> Query
}

class QueryBuilder : QueryBuilderProtocol {
    private var limit: Int = QueryPreset.defaultLimit
    private var offset: Int = QueryPreset.defaultOffset
    private var includedFields: Set<String> = Set(QueryPreset.defaultIncludedFields)
    private var excludedFields: Set<String> = Set(QueryPreset.defaultExcludedFields)
    private var filter: [QueryFilter] = QueryPreset.defaultFilter
    private var search: String = QueryPreset.defaultSearch
    private var sort: String = QueryPreset.defaultSortField
    private var sortOrder: SortOrder = QueryPreset.defaultSortOrder
    private var queryForGET: [URLQueryItem] = []
    private var queryForPOST: String = ""
    
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
    
    func sort(field: String, order: SortOrder) -> QueryBuilderProtocol {
        self.sort = field
        self.sortOrder = order
        return self
    }
    
    private func buildSortQuery() {
        queryForGET.append(URLQueryItem(name: "order", value: "\(sort):\(sortOrder.rawValue)"))
        queryForPOST += "sort " + "\(sort) \(sortOrder.rawValue)" + ";"
    }
    
    func filter(field: String) -> QueryFilterProtocol {
        let queryFilter = QueryFilter(field: field, queryBuilder: self)
        filter.append(queryFilter)
        return queryFilter
    }
    
    private func buildFilterQuery() {
        var temp : [String] = []
        filter.forEach { item in
            queryForGET.append(URLQueryItem(name: "filter\(item.queryForGET.0)", value: "\(item.queryForGET.1)"))
            temp.append(item.queryForPOST)
        }
        queryForPOST += "where \(temp.joined(separator: "&"));"
    }
    
    func search(_ query: String) -> QueryBuilderProtocol {
        self.search = query
        return self
    }
    
    private func buildSearchQuery() {
        filter(field: RequestConstants.Game.name).isEqual(string: search, prefix: true, postfix: false)
    }
    
    private func setDefault() {
        limit = QueryPreset.defaultLimit
        offset = QueryPreset.defaultOffset
        includedFields = Set(QueryPreset.defaultIncludedFields)
        excludedFields = Set(QueryPreset.defaultExcludedFields)
        search = QueryPreset.defaultSearch
        sort = QueryPreset.defaultSortField
        sortOrder = QueryPreset.defaultSortOrder
        filter = QueryPreset.defaultFilter
    
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
            if (!filter.isEmpty) { buildFilterQuery() }
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
    let queryForGET : [URLQueryItem]
    let queryForPOST : String
    
    init(queryForGET: [URLQueryItem], queryForPOST : String) {
        self.queryForGET = queryForGET
        self.queryForPOST = queryForPOST
    }
}


