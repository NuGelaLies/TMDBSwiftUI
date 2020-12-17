//
//  PersonDetail.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/17/20.
//

import Foundation

// MARK: - PersonDetail
struct PersonDetail: Codable {
    let birthday, knownForDepartment, deathday: String
    let id: Int
    let name: String
    let alsoKnownAs: [String]
    let gender: Int
    let biography: String
    let popularity: Double
    let placeOfBirth, profilePath: String
    let adult: Bool
    let imdbId, homepage: String

//    enum CodingKeys: String, CodingKey {
//        case birthday
//        case knownForDepartment = "known_for_department"
//        case deathday, id, name
//        case alsoKnownAs = "also_known_as"
//        case gender, biography, popularity
//        case placeOfBirth = "place_of_birth"
//        case profilePath = "profile_path"
//        case adult
//        case imdbId = "imdb_id"
//        case homepage
//    }
}
