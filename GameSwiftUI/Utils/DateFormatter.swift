//
//  DateFormatter.swift
//  GameSwiftUI
//
//  Created by Joshi on 30.04.21.
//

import Foundation

extension DateFormatter {
    
    struct shared {
        static let date: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/YYYY"
            return formatter
        }()
        
        static let year: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY"
            return formatter
        }()
    }
}
