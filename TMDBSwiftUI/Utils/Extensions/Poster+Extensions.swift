//
//  Poster+Extensions.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import SwiftUI

enum PosterStyle {
    case small, medium, large
}

extension PosterStyle: ViewModifier {
    
    var width: CGFloat {
        switch self {
        case .small: return 53
        case .medium: return 100
        case .large: return 250
        }
    }
    var height: CGFloat {
        switch self {
        case .small: return 80
        case .medium: return 150
        case .large: return 375
        }
    }

    func body(content: Content) -> some View {
        return content
            .frame(width: width, height: height)
            .shadow(radius: 7.0)
            .cornerRadius(5.0)
    }
}

extension View {
        
    func poster(_ style: PosterStyle = .medium) -> some View {
        return ModifiedContent(content: self, modifier: style)
    }
}
