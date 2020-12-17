//
//  MoviesVeiw.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import SwiftUI

struct MoviesVeiw: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Movie")
        }
    }
}

struct MoviesVeiw_Previews: PreviewProvider {
    static var previews: some View {
        MoviesVeiw()
    }
}
