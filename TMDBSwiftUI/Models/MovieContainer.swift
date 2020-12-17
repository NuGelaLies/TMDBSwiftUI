//
//  MoviesModel.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import Foundation

/**
 MovieContainer
 1. poplar movie
 2. Similar
 3. Recommendations
 4. SearchMovies
 5. discover
 6. search person
 */
struct MovieContainer<T: Codable>: Codable {
    let page: Int
    let results: [T]
    let totalResults, totalPages: Int
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalResults = "total_results"
//        case totalPages = "total_pages"
//    }
}

// MARK: - MoviesModel
struct Movies: Codable {
    let posterPath: String
    let adult: Bool
    let overview, releaseDate: String
    let genreIDS: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title, backdropPath: String
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double

//    enum CodingKeys: String, CodingKey {
//        case posterPath = "poster_path"
//        case adult, overview
//        case releaseDate = "release_date"
//        case genreIDS = "genre_ids"
//        case id
//        case originalTitle = "original_title"
//        case originalLanguage = "original_language"
//        case title
//        case backdropPath = "backdrop_path"
//        case popularity
//        case voteCount = "vote_count"
//        case video
//        case voteAverage = "vote_average"
//    }
}

