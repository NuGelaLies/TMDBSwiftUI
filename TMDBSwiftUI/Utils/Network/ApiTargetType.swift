//
//  ApiTargetType.swift
//  HeadlineNews
//
//  Created by NuGelaLies on 2019/9/5.
//  Copyright © 2019 Sing Tao Limited. All rights reserved.
//

import Foundation
import Alamofire

public enum Route {
    case get(String)
    case post(String)
    case put(String)
    case delete(String)
    case options(String)
    case head(String)
    case patch(String)
    case trace(String)
    case connect(String)
    
    public var path: String {
        switch self {
        case .get(let path): return path
        case .post(let path): return path
        case .put(let path): return path
        case .delete(let path): return path
        case .options(let path): return path
        case .head(let path): return path
        case .patch(let path): return path
        case .trace(let path): return path
        case .connect(let path): return path
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .get: return .get
        case .post: return .post
        case .put: return .put
        case .delete: return .delete
        case .options: return .options
        case .head: return .head
        case .patch: return .patch
        case .trace: return .trace
        case .connect: return .connect
        }
    }
}

public protocol ApiTargetType {
    
    /// The target's base `URL`.
    var baseURL: String { get }
    
    /// Returns `Route` which contains HTTP method and URL path information.
    ///
    /// Example:
    ///
    /// ```
    /// var route: Route {
    ///   return .get("/me")
    /// }
    /// ```
    var route: Route { get }
    
    /// The parameters to be encoded in the request.
    var parameters: [String: Any]? { get }
    
    /// The method used for parameter encoding.
    var parameterEncoding: Alamofire.ParameterEncoding { get }
    
    /// The type of HTTP task to be performed.
    var task: ApiTask { get }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool { get }
    
    /// Returns HTTP header values.
    ///
    /// Example:
    ///
    /// ```
    /// var httpHeaderFields: [String: String]? {
    ///   return ["Accept": "application/json"]
    /// }
    /// ```
    var httpHeaderFields: Alamofire.HTTPHeaders? { get }
    
    var useCache: Bool { get }
}

public extension ApiTargetType {
    
    var validate: Bool {
        return false
    }
    
    var url: URL? {
        return URL(string: defaultURLString)
    }
    
    var defaultURLString: String {
        let keyString = baseURL.appending(route.path)
        return keyString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    var path: String {
        return route.path
    }
    
    var httpHeaderFields: [String: String]? {
        return nil
    }
    
    var useCache: Bool {
        return false
    }
}

/// Represents a type of upload task.
public enum UploadType {
    
    /// Upload a file.
    /// URL: Image URl
    /// String: name
    case file(URL, String)
    
    /// Upload "multipart/form-data"
    case multipart([MultipartFormData])
}

/// Represents a type of download task.
public enum DownloadType {
    
    /// Download a file to a destination.
    case request(Alamofire.DownloadRequest.Destination)
}

/// Represents an HTTP task.
public enum ApiTask {
    
    /// A basic request task.
    case request
    
    /// An upload task.
    case upload(UploadType)
    
    /// A download task.
    case download(DownloadType)
}
