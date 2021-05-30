//
//  MostAnticipatedViewModel.swift
//  GameSwiftUI
//
//  Created by Joshi on 09.05.21.
//

import Foundation
import Combine

class MostAnticipatedViewModel: ObservableObject {
    @Published private(set) var loadingState: CollectionLoadingState<[Game]> = .initial
    private var subscriptions: Set<AnyCancellable> = []
    private var cancellable: AnyCancellable!
    private var gameService = GameService(requestBuilder: RequestBuilder())
    init() {
//        $loadingState.compactMap { _ in
//            gameService.fetchGames(query: QueryBuildDirector.makeMostAnticipatedGamesQuery.build()).mapToLoadingState(placeholder: Game.placeholders)
//        }
//        .receive(on: RunLoop.main)
//        .assign(to: &loadingState)
//        

    }
}
