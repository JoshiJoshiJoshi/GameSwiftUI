//
//  IGDBPersistence.swift
//  GameSwiftUI
//
//  Created by Joshi on 28.05.21.
//

import Foundation

class Persistence {
    
    static let shared = Persistence()
    let path: URL
    let url: URL
    
    private init() {
        path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url = path.appendingPathComponent("model.json")
    }


    func saveAll(games: [Game]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(games)
            try data.write(to: url, options: .atomic)
        }
        catch {
            print(error.localizedDescription)
        }
    }

    func loadAll()
    {
        let decoder = JSONDecoder()
        _ = decoder
        do {
            let data = try Data(contentsOf: url)
            _ = data
        }
        catch {
            print(error.localizedDescription)
        }
    }

}
