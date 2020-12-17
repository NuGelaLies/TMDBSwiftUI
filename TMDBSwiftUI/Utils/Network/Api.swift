//
//  Api.swift
//  TMDBSwiftUI
//
//  Created by NuGelaliee on 12/16/20.
//

import Foundation
import Combine

struct Api {
        
    /**
     Get a list of the current popular movies on TMDb. This list updates daily.
     */
    static func poplarMovie() -> Future<MovieContainer<Movies>, ApiError> {
        return Future<MovieContainer<Movies>, ApiError> { (promise) in
            ApiService.shared.request(.popular, mapping: MovieContainer<Movies>.self) { (result) in
                switch result {
                case .success(let model):
                    promise(.success(model))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
    
    /**
     Get the top rated movies on TMDb.
     */
    static func toprateMovie() -> Future<MovieContainer<PersonModel>, ApiError> {
        return Future<MovieContainer<PersonModel>, ApiError> { (promise) in
            ApiService.shared.request(.topRated, mapping: MovieContainer<PersonModel>.self) { (result) in
                switch result {
                case .success(let model):
                    promise(.success(model))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
    
    /**
     Get the daily or weekly trending items. The daily trending list tracks items over the period of a day while items have a 24 hour half life. The weekly list tracks items over a 7 day period, with a 7 day half life.
     
     default media_type: movie time_window: day
     */
    
    static func trendMovies() ->Future<MovieContainer<Movies>, ApiError> {
        return Future<MovieContainer<Movies>, ApiError> { promise in
            ApiService.shared.request(.trending, mapping: MovieContainer<Movies>.self) { (result) in
                switch result {
                case .success(let model):
                    promise(.success(model))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
    
    /**
     Get the videos that have been added to a movie.
     
     */
    static func detail(movie: Int) -> Future<MovieVideosDetail, ApiError> {
        return Future<MovieVideosDetail, ApiError> { promise in
            ApiService.shared.request(.movieDetail(movie: movie), mapping: MovieVideosDetail.self) { (result) in
                switch result {
                case .success(let model):
                    promise(.success(model))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
            
        }
    }
    
    /**
     Get the primary person details by id.
     
     */
    static func detail(person: Int) -> Future<MovieVideosDetail, ApiError> {
        return Future<MovieVideosDetail, ApiError> { promise in
            ApiService.shared.request(.personDetail(person: person), mapping: MovieVideosDetail.self) { (result) in
                switch result {
                case .success(let model):
                    promise(.success(model))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
            
        }
    }
}
