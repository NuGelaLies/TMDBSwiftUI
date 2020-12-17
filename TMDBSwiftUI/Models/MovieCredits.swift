//
//  MovieCredits.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/17/20.
//

import Foundation

// MARK: - PersonDetail
struct CreditsModel<T: Codable>: Codable {
    let cast, crew: [T]
    let id: Int
}

// MARK: - MovieCast
struct MovieCast: Codable {
    let adult: Bool
    let gender, id: Int
    let knownForDepartment, name, originalName: String
    let popularity: Double
    let profilePath, creditId, department, job: String

//    enum CodingKeys: String, CodingKey {
//        case adult, gender, id
//        case knownForDepartment = "known_for_department"
//        case name
//        case originalName = "original_name"
//        case popularity
//        case profilePath = "profile_path"
//        case creditId = "credit_id"
//        case department, job
//    }
}


// MARK: - PersonCast
struct PersonCast: Codable {
    let character: String?
    let creditId, releaseDate: String
    let voteCount: Int
    let video, adult: Bool
    let voteAverage: Double
    let title: String
    let genreIds: [Int]
    let originalLanguage: String
    let originalTitle: String
    let popularity: Double
    let id: Int
    let backdropPath: String?
    let overview: String
    let posterPath: String?
    let department: String?
    let job: String?

//    enum CodingKeys: String, CodingKey {
//        case character
//        case creditId = "credit_id"
//        case releaseDate = "release_date"
//        case voteCount = "vote_count"
//        case video, adult
//        case voteAverage = "vote_average"
//        case title
//        case genreIds = "genre_ids"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case popularity, id
//        case backdropPath = "backdrop_path"
//        case overview
//        case posterPath = "poster_path"
//        case department, job
//    }
}
