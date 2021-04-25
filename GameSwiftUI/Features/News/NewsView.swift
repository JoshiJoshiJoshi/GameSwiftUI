//
//  NewsView.swift
//  GameSwiftUI
//
//  Created by Joshi on 19.04.21.
//

import SwiftUI
import SDWebImageSwiftUI
struct NewsView: View {
    @ObservedObject var newsQuery = NewsQuery()
    var body: some View {
        ScrollView(showsIndicators: false) {
                ForEach(newsQuery.newsItem) { item in
                    VStack(alignment: .leading)
                    {
                        Text(item.title)
                            .font(.title2)
                            .bold()
                            .padding(.top)
                            .padding(.horizontal)
                        HStack {
                            Spacer()
                            WebImage(url: URL(string: "http://localhost:8055/assets/\(item.cover)"))
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
                    .padding(.bottom)
                    .padding(.horizontal)
                }
                .shadow(color: Color.black.opacity(0.2), radius: 10)
            }
    }
}
