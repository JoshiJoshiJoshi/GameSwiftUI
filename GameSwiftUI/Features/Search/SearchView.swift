//
//  SearchView.swift
//  GameSwiftUI
//
//  Created by Joshi on 20.04.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State var shouldShowModal = false
    
    var body: some View {
        VStack {
            HStack {
                AvatarIconView(shouldShowModal: $shouldShowModal)
                SearchBarView(viewModel: viewModel)
                NotificationIconView(viewModel: viewModel)
            }
            .padding(.top)
            CollectionLoadingView(
                loadingState: viewModel.loadingState,
                content: { games in
                    SearchResultView.init(viewModel: viewModel, games: games)
                },
                initial: {
                    MessageView(
                        message: "SEARCH FOR GAMES",
                        imageName: "text.magnifyingglass"
                    )
                },
                empty: {
                    MessageView(
                        message: "NO GAMES FOUND",
                        imageName: "exclamationmark.bubble"
                    )
                },
                error: { error in
                    MessageView(
                        message: error.localizedDescription,
                        imageName: "exclamationmark.triangle"
                    )
                    .foregroundColor(.red)
                }
            )
        }
    }
}

struct SearchListItemView: View {
    @ObservedObject var viewModel: SearchViewModel
    var game: Game
    
    var body: some View {
        HStack {
            WebImage(url: viewModel.getImageUrl(game: game,
                                                imageSize: .coverBig,
                                                retina: true))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                        .cornerRadius(5.0)
                }
                .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fill)
                .frame(width: 85, height: 120, alignment: .center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                // MARK: - WIP
                Text("\(game.name) (\(game.firstReleaseDateAsYearString))")
                    .font(.headline)
                    .lineLimit(1)
                Text(game.storyline ?? game.summary ?? "No description available.")
                    .font(.subheadline)
                    .lineLimit(4)
                Spacer()
                //                HStack {
                //                    ScrollView(.horizontal) {
                //                        ForEach(game.genres ?? []) { genre in
                //                                Text(genre.name ?? "N/A")
                //                        }
                //                    }
                //                }
                HStack {
                    Image(systemName: "star.fill")
                        .cornerRadius(5.0)
                    Text(game.totalRatingAsString)
                }
            }
            Spacer()
        }
        .frame(height: 121)
        .padding(.horizontal)
    }
}

struct SearchResultView: View {
    @ObservedObject var viewModel: SearchViewModel
    let games: [Game]
    
    var body: some View {
        ScrollView {
            ForEach(games) { game in
                SearchListItemView(viewModel: viewModel, game: game)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let gameService = GameService(requestBuilder: RequestBuilder())
        let queryBuilder = QueryBuilder()
        SearchView(viewModel: SearchViewModel(searchClerk: SearchClerk(queryBuilder: queryBuilder, gameService: gameService)))
    }
}

struct SearchBarView: View {
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        TextField("Search", text: $viewModel.searchInput)
            .padding(8)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    
                    if viewModel.searchInput != "" {
                        Button(action: {
                            self.viewModel.searchInput = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    }
                }
            )
    }
}

struct AvatarIconView: View {
    @Binding var shouldShowModal: Bool
    var body: some View {
        Image(uiImage: #imageLiteral(resourceName: "avatar"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(60)
            .padding(.leading)
            .onTapGesture {
                shouldShowModal.toggle()
            }
            .sheet(isPresented: $shouldShowModal, content: {
                MostAnticipatedView()
            })
    }
}

struct NotificationIconView: View {
    @ObservedObject var viewModel: SearchViewModel
    @ObservedObject var networkMonitor = NetworkMonitor()
    var body: some View {
        Image(systemName: networkMonitor.isConnected ? "wifi" : "wifi.slash")
            .font(.title2)
            .padding(.trailing)
            .onTapGesture {
                // MARK: - WIP
                withAnimation(.easeInOut(duration: 0.2)) {
                    viewModel.sortList()
                }
            }
    }
}
