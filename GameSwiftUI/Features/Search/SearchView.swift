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
    var body: some View {
        VStack {
            HStack {
                TextField("Title", text: $viewModel.searchInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                Image(systemName: "arrow.up.arrow.down.circle")
                    .font(.title3)
                    .padding(.trailing)
                    .onTapGesture {
                        // MARK: - WIP
                        viewModel.sortList()
                    }
            }
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
            WebImage(url: viewModel.getImageUrl(game: game, imageSize: .coverBig))
                .resizable()
                .placeholder {
                    ZStack {
                        Rectangle().foregroundColor(.gray)
                            .cornerRadius(5.0)
                    }
                }
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fill)
                .frame(width: 85, height: 120, alignment: .center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                // MARK: - WIP
                Text("\(game.name ?? "nil") (\(viewModel.formatTimestampToYear(game: game)))")
                    .font(.headline)
                    .lineLimit(1)
                Text(game.summary ?? "No description available.")
                    .font(.subheadline)
                    .lineLimit(4)
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .cornerRadius(5.0)
                    Text("\((game.totalRating?.rounded() ?? 0.0) != 0 ? String(game.totalRating!.rounded()) : "N/A") ")
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
