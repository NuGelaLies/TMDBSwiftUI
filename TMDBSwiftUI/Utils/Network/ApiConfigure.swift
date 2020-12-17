//
//  ApiTarget.swift
//  HeadlineNews
//
//  Created by NuGelaLies on 2019/9/5.
//  Copyright © 2019 Sing Tao Limited. All rights reserved.
//

import Foundation
import Alamofire


enum ApiConfigure {
    case popular, topRated, upcoming, nowPlaying, trending
    case movieDetail(movie: Int), recommended(movie: Int), similar(movie: Int), videos(movie: Int)
    case credits(movie: Int), review(movie: Int)
    case searchMovie, searchKeyword, searchPerson
    case popularPersons
    case personDetail(person: Int)
    case personMovieCredits(person: Int)
    case personImages(person: Int)
    case genres
    case discover
}

extension ApiConfigure: ApiTargetType {
    var baseURL: String {
        return Consts.basicURL
    }
    
    var task: ApiTask {
        return .request
    }
    
    var route: Route {
        switch self {
        case .popular:
            return .get("movie/popular")
        case .popularPersons:
            return .get("person/popular")
        case .topRated:
            return .get("movie/top_rated")
        case .upcoming:
            return .get("movie/upcoming")
        case .nowPlaying:
            return .get("movie/now_playing")
        case .trending:
            return .get("trending/movie/day")
        case let .movieDetail(movie):
            return .get("movie/\(String(movie))")
        case let .videos(movie):
            return .get("movie/\(String(movie))/videos")
        case let .personDetail(person):
            return .get("person/\(String(person))")
        case let .credits(movie):
            return .get("movie/\(String(movie))/credits")
        case let .review(movie):
            return .get("movie/\(String(movie))/reviews")
        case let .recommended(movie):
            return .get("movie/\(String(movie))/recommendations")
        case let .similar(movie):
            return .get("movie/\(String(movie))/similar")
        case let .personMovieCredits(person):
            return .get("person/\(person)/movie_credits")
        case let .personImages(person):
            return .get("person/\(person)/images")
        case .searchMovie:
            return .get("search/movie")
        case .searchKeyword:
            return .get("search/keyword")
        case .searchPerson:
            return .get("search/person")
        case .genres:
            return .get("genre/movie/list")
        case .discover:
            return .get("discover/movie")
        }
           
    }
    
    var parameters: [String : Any]? {
        var params = [String: Any]()
        params["api_key"] = Consts.keys.auth
        params["language"] = Locale.preferredLanguages[0]
        return params
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    var httpHeaderFields: Alamofire.HTTPHeaders? {
        return nil
    }

}
