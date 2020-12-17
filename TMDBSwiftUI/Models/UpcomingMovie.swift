//
//  UpcomingMovie.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/17/20.
//

import Foundation

//MARK: - upcoming and playing movies
struct UpcomingMovie: Codable {
    let page: Int
    let results: [Movies]
    let dates: DatesModel?
    let totalPages, totalResults: Int
}

// MARK: - Dates
struct DatesModel: Codable {
    let maximum, minimum: String
}
