//
//  SearchView.swift
//  GameSwiftUI
//
//  Created by Joshi on 20.04.21.
//

// Resources 
// WebImages & Placeholders https://sdwebimage.github.io/SDWebImageSwiftUI/
import SwiftUI
import SDWebImageSwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel(
        queryBuilder: QueryBuilder(),
        requestBuilder: RequestBuilder()
    )
    var body: some View {
        VStack {
            TextField("Title", text: $vm.searchInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            ScrollView {
                ForEach(vm.searchResults) { game in
                    ListItem(game: game)
                }
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ListItem: View {
    var game: Game
    var body: some View {
        HStack {
            WebImage(url: URL(string: "https://images.igdb.com/igdb/image/upload/t_cover_big/\(game.cover?.imageID ?? "").jpg"))
                .resizable()
                .placeholder {
                    ZStack {
                        Rectangle().foregroundColor(.gray)
                        Image(systemName: "photo")
                    }
                }
                .transition(.fade(duration: 0.5))
                .aspectRatio(contentMode: .fill)
                .frame(width: 85, height: 120, alignment: .center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(game.name ?? "nil")
                    .font(.headline)
                    .lineLimit(1)
                Text(game.summary ?? "No description available.")
                    .font(.subheadline)
                    .lineLimit(4)
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                    Text("\((game.totalRating?.rounded() ?? 0.0) != 0 ? String(game.totalRating!.rounded()) : "N/A") ")
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}


