//
//  ContentView.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

// Resources
// Using TabView & NavigationView together https://stackoverflow.com/questions/57329412/navigationview-title-doesnt-appear-when-the-views-are-in-tabview-in-swiftui 

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
            .onAppear() {

//                let url = RequestBuilder()
//                    .
//                print("XD QUERY: \(query)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
