//
//  DetailView.swift
//  GameSwiftUI
//
//  Created by Joshi on 25.04.21.
//

import SwiftUI

struct GameDetailView: View {
    @ObservedObject var viewModel: GameDetailViewModel
    
    var body: some View {
        Text("")
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(viewModel: GameDetailViewModel())
    }
}
