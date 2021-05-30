//
//  MostAnticipatedView.swift
//  GameSwiftUI
//
//  Created by Joshi on 09.05.21.
//

import SwiftUI

struct MostAnticipatedView: View {
    var viewModel = MostAnticipatedViewModel()
    var body: some View {
        VStack {
            CollectionLoadingView(
                loadingState: viewModel.loadingState,
                content: { games in
                    SearchResultView.init(viewModel: SearchViewModel(searchClerk: SearchClerk(queryBuilder: QueryBuilder(), gameService: GameService(requestBuilder: RequestBuilder()))), games: games)
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
                })
            }
        }
    }


struct MostAnticipatedView_Previews: PreviewProvider {
    static var previews: some View {
        MostAnticipatedView()
    }
}
