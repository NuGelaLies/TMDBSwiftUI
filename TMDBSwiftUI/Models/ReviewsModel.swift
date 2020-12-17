//
//  ReviewsModel.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/17/20.
//

import Foundation

// MARK: - Result
struct ReviewsModel: Codable {
    let author: String
    let authorDetails: AuthorDetails
    let content, createdAt, id, updatedAt: String
    let url: String

//    enum CodingKeys: String, CodingKey {
//        case author
//        case authorDetails = "author_details"
//        case content
//        case createdAt = "created_at"
//        case id
//        case updatedAt = "updated_at"
//        case url
//    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int?

//    enum CodingKeys: String, CodingKey {
//        case name, username
//        case avatarPath = "avatar_path"
//        case rating
//    }
}
