//
//  QueryWhereBuilder.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import Foundation
// Resource
// https://api-docs.igdb.com/#filters

protocol QueryFilterProtocol {
    // Revisit: POST-method doesn't work due to wrong string conversion
    func isEqual(string: String, prefix: Bool, postfix: Bool) -> QueryBuilderProtocol
    func isEqual(value: Int) -> QueryBuilderProtocol
    // Revisit: POST-method doesn't work due to wrong string conversion
    func isNotEqual(string: String, prefix: Bool, postfix: Bool) -> QueryBuilderProtocol
    func isNotEqual(value: Int) -> QueryBuilderProtocol
    func isGreaterThan(value: Int) -> QueryBuilderProtocol
    func isGreaterOrEqual(value: Int) -> QueryBuilderProtocol
    func isLessThan(value: Int) -> QueryBuilderProtocol
    func isLessOrEqual(value: Int) -> QueryBuilderProtocol
    func isNull() -> QueryBuilderProtocol
    func isNotNull() -> QueryBuilderProtocol
}

class QueryFilter : QueryFilterProtocol {
    private var queryBuilder: QueryBuilderProtocol
    private var field: String
    var queryForGET: (String, String) = ("", "")
    var queryForPOST: String = ""

    init(field: String, queryBuilder: QueryBuilderProtocol) {
        self.field = field
        self.queryBuilder = queryBuilder
    }
    
    func isEqual(string: String, prefix: Bool = false, postfix: Bool = false) -> QueryBuilderProtocol {
        let tempStr = "\(postfix ? "*" : "")\"\(string)\"\(prefix ? "*" : "")"
        queryForGET = ("[\(self.field)][eq]", "\(tempStr)")
        queryForPOST += "\(self.field)~\(tempStr)"
        return queryBuilder
    }
    
    func isEqual(value: Int) -> QueryBuilderProtocol {
        queryForGET = ("[\(self.field)][eq]", "\(value)")
        queryForPOST += "\(self.field)=\(value)"
        return queryBuilder
    }
    func isNotEqual(string: String, prefix: Bool = false, postfix: Bool = false) -> QueryBuilderProtocol {
        let tempStr = "\(postfix ? "*" : "")\"\(string)\"\(prefix ? "*" : "")"
        queryForGET = ("[\(self.field)][not_eq]", "\(tempStr)")
        queryForPOST += "\(self.field)!=\(tempStr)"
        return queryBuilder
    }

    func isNotEqual(value: Int) -> QueryBuilderProtocol {
        queryForGET = ("[\(self.field)][not_eq]", "\(value)")
        queryForPOST += "\(self.field)!=\(value)"
        return queryBuilder
    }
    
    func isGreaterThan(value: Int) -> QueryBuilderProtocol {
        queryForGET = ("[\(self.field)][gt]", "\(value)")
        queryForPOST += "\(self.field)>\(value)"
        return queryBuilder
    }
    
    func isGreaterOrEqual(value: Int) -> QueryBuilderProtocol {
        queryForGET = ("[\(self.field)][gte]", "\(value)")
        queryForPOST += "\(self.field)>=\(value)"
        return queryBuilder
    }
    
    func isLessThan(value: Int) -> QueryBuilderProtocol {
        queryForGET = ("[\(self.field)][lt]", "\(value)")
        queryForPOST += "\(self.field)<\(value)"
        return queryBuilder

    }
    
    func isLessOrEqual(value: Int) -> QueryBuilderProtocol {
        queryForGET = ("[\(self.field)][lte]", "\(value)")
        queryForPOST += "\(self.field)<=\(value)"
        return queryBuilder
    }
    
    func isNotNull() -> QueryBuilderProtocol {
        queryForGET = ("[\(self.field)][not_eq]", "null")
        queryForPOST += "\(self.field)!=null"
        return queryBuilder
    }
    
    func isNull() -> QueryBuilderProtocol {
        queryForGET = ("[\(self.field)][eq]", "null")
        queryForPOST += "\(self.field)=null"
        return queryBuilder
    }
}
