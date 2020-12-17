//
//  ApiError.swift
//  HeadlineNews
//
//  Created by NuGelaLies on 2019/7/10.
//  Copyright © 2019 Sing Tao Limited. All rights reserved.
//

import Foundation


enum AnalysisError: Swift.Error {
    case parseJSONError
    case inValidJSON
    case emptyData
    //  case notSuccessfulHTTP
    case mapObjectError
    //  case error(code: Int, message: String)
}

public enum ApiError: Error {
    case noResponse
    case jsonDecodingError(error: Error)
    case networkError(error: Error)
    case timeOut
    case error(code: Int, message: String)
    
    var string: String {
        switch self {
        case .timeOut: return "time out"
        case .error(code: _, message: let message):
            return message
        case .jsonDecodingError(error: let error),
             .networkError(error: let error):
            return error.localizedDescription
        case .noResponse:
            return ""
        }
    }
}
