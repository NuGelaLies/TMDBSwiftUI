//
//  MoviesRow.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviesRow: View {
    var imageURL: String
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .topLeading) {
                PosterImage(imageURL: imageURL)
                    .poster()
            }
            .fixedSize()
            .animation(.spring())
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Test movie Test movie Test movie Test movie Test movie Test movie Test movie")
                    .foregroundColor(.steam_gold)
                    .lineLimit(2)
                Text("Test movie Test movie")
                    .foregroundColor(.primary)
                    .font(.subheadline)
                    .lineLimit(1)
                Text("Test desc")
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    .lineLimit(3)
                    .truncationMode(.tail)
            }.padding(.leading, 8)
        }
    }
}

struct MoviesRow_Previews: PreviewProvider {
    static var previews: some View {
        MoviesRow(imageURL: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4220574528,1771157773&fm=11&gp=0.jpg")
    }
}
