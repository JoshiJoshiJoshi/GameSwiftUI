//
//  ContentView.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import SwiftUI
import Combine

let tabs = ["Home", "Search", "Play"]
let tabIcon = ["Home" : "house.fill", "Search" : "magnifyingglass", "Play" : "gamecontroller.fill"]
//struct ContentView: View {
//    @ObservedObject var viewModel: ContentViewModel
//    @State var shouldShowModal = false
//
//    var body: some View {
//        TabView {
//            NewsView(viewModel: viewModel.newsViewModel)
//                .tag(0)
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//            SearchView(viewModel: viewModel.searchViewModel)
//                .tag(1)
//                .tabItem {
//                    Image(systemName: "magnifyingglass")
//                    Text("Search")
//                }
//            Text("Placeholder")
//                .tabItem {
//                    Image(systemName: "gamecontroller.fill")
//                    Text("Play")
//                }
//                .tag(2)
//        }
//    }
//}

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    @State var shouldShowModal = false
    
    var body: some View {
        Home(viewModel: viewModel)
    }
}

struct Home: View {
    @ObservedObject var viewModel: ContentViewModel
    
    @State var selectedTab = "Home"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Namespace var animation
    
    var body: some View{
        VStack(spacing: 0) {
                ZStack {
                    // Second tab
                    NewsView(viewModel: viewModel.newsViewModel)
                        .opacity(selectedTab == "Home" ? 1 : 0)
                    
                    // Third tab
                    SearchView(viewModel: viewModel.searchViewModel)
                        .opacity(selectedTab == "Search" ? 1 : 0)
                    
                    // Fourth tab
                    Text("Play")
                        .opacity(selectedTab == "Play" ? 1 : 0)
                }
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                    if tab != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, edges!.bottom == 0 ? 15 : edges!.bottom)
            .background(Color.white)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

struct TabButton: View {
    var title: String
    @Binding var selectedTab: String
    var animation: Namespace.ID
    
    var body: some View{
        Button(action: {
            selectedTab = title
//            withAnimation { selectedTab = title }
        }) {
            VStack(spacing: 6) {
                ZStack {
                    CustomShape()
                        .fill(Color.clear)
                        .frame(width: 45, height: 6)
                    if selectedTab == title {
                        CustomShape()
                            .fill(Color("tint"))
                            .frame(width: 45, height: 6)
                            .matchedGeometryEffect(id: "ChangeTab", in: animation)
                    }
                }
                .padding(.bottom, 10)
                
                Image(systemName: tabIcon[title]!)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(selectedTab == title ? Color("tint") : Color.black.opacity(0.2))
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(selectedTab == title ? 0.6 : 0.2))
                
            }
        }
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}

