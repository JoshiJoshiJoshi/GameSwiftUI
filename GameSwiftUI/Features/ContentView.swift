//
//  ContentView.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                NewsView(viewModel: viewModel.newsViewModel)
                .navigationTitle("News")
            }
            .tag(0)
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            NavigationView {
                SearchView(viewModel: viewModel.searchViewModel)
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
