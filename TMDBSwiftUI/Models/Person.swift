//
//  Person.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import Foundation

// MARK: - Result
struct PersonModel: Codable {
    let profilePath: String
    let adult: Bool
    let id: Int
    let knownFor: [KnownForModel]
    let name: String
    let popularity: Double

//    enum CodingKeys: String, CodingKey {
//        case profilePath = "profile_path"
//        case adult, id
//        case knownFor = "known_for"
//        case name, popularity
//    }
}

// MARK: - KnownFor
struct KnownForModel: Codable {
    let posterPath: String
    let adult: Bool?
    let overview: String
    let releaseDate, originalTitle: String?
    let genreIds: [Int]
    let id: Int
    let mediaType: String, originalLanguage: String
    let title: String?
    let backdropPath: String
    let popularity: Double
    let voteCount: Int
    let video: Bool?
    let voteAverage: Double
    let firstAirDate: String?
    let originCountry: [String]?
    let name, originalName: String?

//    enum CodingKeys: String, CodingKey {
//        case posterPath = "poster_path"
//        case adult, overview
//        case releaseDate = "release_date"
//        case originalTitle = "original_title"
//        case genreIDS = "genre_ids"
//        case id
//        case mediaType = "media_type"
//        case originalLanguage = "original_language"
//        case title
//        case backdropPath = "backdrop_path"
//        case popularity
//        case voteCount = "vote_count"
//        case video
//        case voteAverage = "vote_average"
//        case firstAirDate = "first_air_date"
//        case originCountry = "origin_country"
//        case name
//        case originalName = "original_name"
//    }
}
