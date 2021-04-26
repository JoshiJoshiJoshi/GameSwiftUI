//
//  NewsView.swift
//  GameSwiftUI
//
//  Created by Joshi on 19.04.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        VStack() {
            Spacer()
            CollectionLoadingView(
                loadingState: viewModel.loadingState,
                content: { news in
                    NewsListView.init(viewModel: viewModel, news: news)
                },
                initial: {
                    MessageView(
                        message: "NEWS WILL BE DISPLAYED HERE",
                        imageName: "exclamationmark.bubble"
                    )
                },
                empty: {
                    MessageView(
                        message: "NO NEW NEWS",
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
        .navigationBarItems(trailing:
                                Image(systemName: "goforward")
                                .onTapGesture {
                                    viewModel.getNews()
                                }
        )
    }
}

struct NewsListView: View {
    @ObservedObject var viewModel: NewsViewModel
    var news: [News]
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ScrollViewReader { _ in
                    ForEach(news) { item in
                        NewsListItemView(viewModel: viewModel, item: item)
                    }
                    .shadow(color: Color.black.opacity(0.2), radius: 10)
                }
            }
        }
    }
}

struct NewsListItemView: View {
    @ObservedObject var viewModel: NewsViewModel
    var item: News
    
    var body: some View {
        VStack(alignment: .leading)
        {
            Text(item.title)
                .font(.title2)
                .bold()
                .padding(.top)
                .padding(.horizontal)
            HStack {
                Spacer()
                WebImage(url: viewModel.getMediaUrl(news: item))
                    .resizable()
                    .frame(maxWidth: 256, maxHeight: 256)
                    .scaledToFit()
                    //.aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    .padding(.horizontal)
                Spacer()
            }
            Text(item.description)
                .font(.subheadline)
                .padding()
            Spacer()
            HStack {
                Spacer()
                Text("Read more")
                    .font(.caption)
                    .opacity(0.3)
            }
            .padding()
        }
        .frame(height: 500, alignment: .center)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .cornerRadius(10)
        .padding()
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(viewModel: NewsViewModel(newsClerk: NewsClerk(newsService: NewsService())))
    }
}
