//
//  CollectionLoadingView.swift
//  GameSwiftUI
//
//  Created by Joshi on 24.04.21.
//

import SwiftUI

public struct CollectionLoadingView<Item, Content: View, InitialView: View, EmptyView: View, ErrorView: View>: View {
    private let fade = AnyTransition.opacity.animation(Animation.easeInOut(duration: 0.2))
    private let state: CollectionLoadingState<[Item]>
    private let makeContent: ([Item]) -> Content
    private let makeInitial: () -> InitialView
    private let makeEmpty: () -> EmptyView
    private let makeError: (Error) -> ErrorView
    public init(
        loadingState: CollectionLoadingState<[Item]>,
        @ViewBuilder content: @escaping ([Item]) -> Content,
        @ViewBuilder initial: @escaping () -> InitialView,
        @ViewBuilder empty: @escaping () -> EmptyView,
        @ViewBuilder error: @escaping (Error) -> ErrorView
    ) {
        state = loadingState
        makeContent = content
        makeInitial = initial
        makeEmpty = empty
        makeError = error
    }
    public var body: some View {
        switch state {
        case let .loading(placeholders):
            makeContent(placeholders)
                .redacted(reason: .placeholder)
                .shimmer()
                .disabled(true)
                .transition(fade)
        case let .loaded(items):
            makeContent(items)
                .transition(fade)
        case .initial:
            makeInitial()
                .transition(fade)
        case .empty:
            makeEmpty()
                .transition(fade)
        case let .error(error):
            makeError(error)
                .transition(fade)
        }
    }
}

