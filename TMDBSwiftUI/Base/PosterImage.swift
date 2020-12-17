//
//  PosterImage.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct PosterImage: View {
    var imageURL: String
    var body: some View {
        WebImage(url: URL(string: imageURL), options: [.refreshCached, .retryFailed])
            .renderingMode(.original)
            .placeholder {
                Rectangle().foregroundColor(Color.gray.opacity(0.5))
            }
            .scaledToFill()
            .animation(.easeInOut)
            .transition(.opacity)
            
    }
}

struct PosterImage_Previews: PreviewProvider {
    static var previews: some View {
        PosterImage(imageURL: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4220574528,1771157773&fm=11&gp=0.jpg")
    }
}
