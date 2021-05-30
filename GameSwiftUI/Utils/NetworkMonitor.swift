//
//  NetworkMonitor.swift
//  GameSwiftUI
//
//  Created by Joshi on 30.04.21.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkMonitor")
    @Published var isConnected = true
    
    static let shared = NetworkMonitor()
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
}
