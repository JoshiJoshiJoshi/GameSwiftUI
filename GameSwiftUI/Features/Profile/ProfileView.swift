//
//  ProfileView.swift
//  GameSwiftUI
//
//  Created by Joshi on 06.05.21.
//

import SwiftUI

struct ProfileView: View {
    @State var limitValue = "0"
    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "avatar"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 128, height: 128, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(60)
                .padding()
            Text("JoshiJoshiJoshi").font(.title)
            HStack {
                Text("Points")
                    .font(.title3)
                    .padding()
                Spacer()
                TextField("limit", text: $limitValue)
                Button("Submit") {
                    Config.Query.defaultLimit = Int(limitValue) ?? 0
                    print(Config.Query.defaultLimit)
                }
                .padding()
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(limitValue: "10")
    }
}
