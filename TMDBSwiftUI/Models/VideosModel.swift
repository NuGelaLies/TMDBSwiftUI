//
//  VideosModel.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/17/20.
//

import Foundation

// MARK: - MovieDetail
struct MovieVideosDetail: Codable {
    let id: Int
    let results: [VideosModel]
}

struct VideosModel: Codable {
    let id, iso639_1, iso3166_1, key: String
    let name, site: String
    let size: Int
    let type: String

    enum CodingKeys: String, CodingKey {
        case id
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case key, name, site, size, type
    }
}
