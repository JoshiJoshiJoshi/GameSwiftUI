//
//  QueryBuilderOLD.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import Foundation
// Resources:
// API syntax: https://apicalypse.io/syntax/
// Error Handling: https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html
// Make it crash in a debug environment: https://www.donnywals.com/responsibly-crashing-your-apps/
// Official Wrapper: https://github.com/husnjak/IGDB-SWIFT-API/blob/master/Sources/IGDB-SWIFT-API/Wrapper/APICalypse.swift

// Not complete
class QueryPresetOLD {
    var requestMethod: RequestMethod = .GET
    var limitParameter: Int = 50
    var offsetParameter: Int = 0
    var includedFieldsParameters: [String] = []
    var excludedFieldsParameters: [String] = []
    var sortByField: String = ""
    var sortOrder: SortOrder = .DESCENDING
    var searchParameter: String = ""
    
    init(requestMethod: RequestMethod = .GET,
         limitValue: Int = 50,
         offsetValue: Int = 0,
         includeFields: [String] = [RequestConstants.Game.name],
         excludeFields: [String] = [],
         sortByField: String = "",
         sortOrder: SortOrder = .DESCENDING,
         search: String = ""
    )
    {
        self.requestMethod = requestMethod
        self.limitParameter = limitValue
        self.offsetParameter = offsetValue
        self.includedFieldsParameters = includeFields
        self.excludedFieldsParameters = excludeFields
        self.sortByField = sortByField
        self.sortOrder = sortOrder
        self.searchParameter = search
    }
}

protocol QueryBuilderProtocolOLD {
    func setPreset(preset: QueryPresetOLD) -> QueryBuilderProtocolOLD // Rework
    func setRequestMethod(as method: RequestMethod) -> QueryBuilderProtocolOLD // finished
    func limit(_ value: Int) -> QueryBuilderProtocolOLD  // finished
    func offset(_ value: Int) -> QueryBuilderProtocolOLD // finished
    func include(_ field: String...) -> QueryBuilderProtocolOLD // mostly finished, Rework input validation
    func exclude(_ field: String...) -> QueryBuilderProtocolOLD // mostly finished, Rework input validation
    func sort(field: String, order: SortOrder) -> QueryBuilderProtocolOLD // finished
    // func filter(_ query: String) -> QueryBuilderProtocol
    func search(_ query: String) -> QueryBuilderProtocolOLD // Revisit: Keep or delete? 'filter' is way superior
    func build() -> String // Rework
}

class QueryBuilderOLD : QueryBuilderProtocolOLD {
//    func filter(_ query: String) -> QueryBuilderProtocol {
//        <#code#>
//    }
    private var requestMethod: RequestMethod = .GET
    private var limitParam: Int = 50
    private var offsetParam: Int = 0
    private var includedFieldsParam: [String] = []
    private var excludedFieldsParam: [String] = []
    private var searchParam: String = ""
    private var sortByFieldParam: String = ""
    private var sortOrder: SortOrder = .DESCENDING
// ---------------------------------------------------------------------- //
    /// Setting a preset will override all previous configurations. Use with caution!
    func setPreset(preset: QueryPresetOLD) -> QueryBuilderProtocolOLD {
        self.requestMethod = preset.requestMethod
        self.limitParam = preset.limitParameter
        self.offsetParam = preset.offsetParameter
        self.includedFieldsParam = preset.includedFieldsParameters
        self.excludedFieldsParam = preset.excludedFieldsParameters
        self.sortByFieldParam = preset.sortByField
        self.sortOrder = preset.sortOrder
        self.searchParam = preset.searchParameter
        return self
    }
// ---------------------------------------------------------------------- //
    func setRequestMethod(as method: RequestMethod) -> QueryBuilderProtocolOLD {
        requestMethod = method
        return self
    }
// ---------------------------------------------------------------------- //
    func limit(_ value: Int) -> QueryBuilderProtocolOLD {
        limitParam = value
        return self
    }
    
    private func buildLimitQuery() throws -> String {
        guard limitParam > 0 else {
            throw QueryError.invalidInput("Limit value cannot be less than 1.")
        }
        guard limitParam <= 500 else {
            throw QueryError.invalidInput("Limit value cannot exceed 500.")
        }
        
        switch requestMethod {
        case .GET:
            let query = "limit=" + String(limitParam)
            return query
        case .POST:
            let query = "limit " + String(limitParam) + ";"
            return query
        }
    }
// ---------------------------------------------------------------------- //
    func offset(_ value: Int) -> QueryBuilderProtocolOLD {
        offsetParam = value
        return self
    }
    
    private func buildOffsetQuery() throws -> String{
        guard offsetParam >= 0 else {
            throw QueryError.invalidInput("Offset value cannot be less than 0.")
        }
        
        switch requestMethod {
        case .GET:
            let query = "offset=" + String(offsetParam)
            return query
        case .POST:
            let query = "offset " + String(offsetParam) + ";"
            return query
        }
    } 
// ---------------------------------------------------------------------- //
    func include(_ field: String...) -> QueryBuilderProtocolOLD {
        field.forEach { item in
            includedFieldsParam.append(item)
        }
        return self
    }
    
    private func buildIncludeQuery() throws -> String {
        guard !(includedFieldsParam.filter({ !($0 == "") }).isEmpty) else {
            throw QueryError.invalidInput("Included field parameters cannot be empty.")
        }
        
        switch requestMethod {
        case .GET:
            let query = "fields=" + includedFieldsParam
                .sorted()
                .joined(separator: ",")
            return query
        case .POST:
            let query = "fields " + includedFieldsParam
                .sorted()
                .joined(separator: ",") + ";"
            return query
        }
    }
// ---------------------------------------------------------------------- //
    func exclude(_ field: String...) -> QueryBuilderProtocolOLD {
        field.forEach { item in
            excludedFieldsParam.append(item)
        }
        return self
    }
    
    private func buildExcludeQuery() throws -> String {
        guard !(includedFieldsParam.filter({ !($0 == "") }).isEmpty) else {
            throw QueryError.invalidInput("Excluded field parameters cannot be empty.")
        }
        
        switch requestMethod {
        case .GET:
            let query = "exclude=" + excludedFieldsParam
                .sorted()
                .joined(separator: ",")
            return query
        case .POST:
            let query = "exclude " + excludedFieldsParam
                .sorted()
                .joined(separator: ",") + ";"
            return query
        }
    }
// ---------------------------------------------------------------------- //
    func search(_ query: String) -> QueryBuilderProtocolOLD {
        self.sortByFieldParam = query
        return self
    }
    
    func buildSearchQuery() -> String {
        switch requestMethod {
        case .GET:
            let query = "search=" + String(limitParam)
            return query
        case .POST:
            let query = "search " + String(limitParam) + ";"
            return query
        }
    }
// ---------------------------------------------------------------------- //
    func sort(field: String, order: SortOrder) -> QueryBuilderProtocolOLD {
        self.sortByFieldParam = field
        self.sortOrder = order
        return self
    }
    
    private func buildSortQuery() throws -> String {
        guard searchParam == "" else {
            throw QueryError.invalidInput("Search and sorting cannot be used together.")
        }
        switch requestMethod {
        case .GET:
            let query = "order=" + String(sortByFieldParam) + ":\(sortOrder.rawValue)"
            return query
        case .POST:
            let query = "sort " + String(sortByFieldParam) + "\(sortOrder.rawValue);"
            return query
        }
    }
// ---------------------------------------------------------------------- //
    func build() -> String {
        var finalQuery = ""
        do {
            try finalQuery += (requestMethod == .GET ? "?" : "") + buildLimitQuery()
            try finalQuery += (requestMethod == .GET ? "&" : "") + buildOffsetQuery()
            try finalQuery += (requestMethod == .GET ? "&" : "") + buildIncludeQuery()
            if !excludedFieldsParam.isEmpty {
                try finalQuery += (requestMethod == .GET ? "&" : "") + buildExcludeQuery()
            }
            if !searchParam.isEmpty {
                finalQuery += (requestMethod == .GET ? "&" : "") + buildSearchQuery()
            }
            if !sortByFieldParam.isEmpty {
                try finalQuery += (requestMethod == .GET ? "&" : "") + buildSortQuery()
            }
            
        } catch QueryError.invalidInput(let msg){
            assertionFailure(msg)
        } catch {
            assertionFailure("Unknown error occurred.")
        }
        return finalQuery
    }
}


