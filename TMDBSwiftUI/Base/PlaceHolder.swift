//
//  PlaceHolder.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import SwiftUI

struct PlaceHolder: View {
    var body: some View {
       Rectangle()
        .foregroundColor(.gray)
        .fixedSize()
    }
}

struct PlaceHolder_Previews: PreviewProvider {
    static var previews: some View {
        PlaceHolder()
    }
}
