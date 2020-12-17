//
//  ContentView.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tab = Tab.movie
    
    enum Tab {
        case movie, star, found, mine
    }
    
    var body: some View {
        TabView(selection: $tab) {
            MoviesVeiw()
                .tabItem {
                    Label("Movies", systemImage: "flame.fill")
                }.tag(Tab.movie)
            MovieStarsView()
                .tabItem {
                    Label("Stars", systemImage: "star.fill")
                }.tag(Tab.star)
            FoundView()
                .tabItem {
                    Label("Found", systemImage: "magnifyingglass")
                }.tag(Tab.found)
            MineView()
                .tabItem {
                    Label("Mine", systemImage: "cloud.fill")
                }.tag(Tab.mine)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
