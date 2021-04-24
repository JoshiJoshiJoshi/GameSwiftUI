//
//  ContentView.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
            NewsView()
                .navigationTitle("News")
            }
            .tag(0)
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            NavigationView {
                SearchView()
                .navigationTitle("Search")
            }
            .tag(1)
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
