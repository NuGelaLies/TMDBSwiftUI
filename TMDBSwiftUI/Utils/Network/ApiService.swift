//
//  ApiService1.swift
//  HeadlineNews
//
//  Created by NuGelaLies on 2019/9/5.
//  Copyright © 2019 Sing Tao Limited. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Result
/// 网络状态
enum NetworkStatus {
    case unknown
    case notReachable
    case reachableViaWiFi
    case reachableViaWWAN
}

let reachability: NetworkReachabilityManager? = NetworkReachabilityManager(host: Consts.basicURL)

final class ApiService {
    let provider: Alamofire.Session
    
   
    static var shared: ApiService {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        configuration.requestCachePolicy = .useProtocolCachePolicy
        let provider = Alamofire.Session(configuration: configuration) 
        return ApiService(provider: provider)
    }
    
    init(provider: Alamofire.Session = .default) {
        self.provider = provider
    }
    
}

extension ApiService {
    
    public func request<C: Codable>(locale name: String,
                                    mapping: C.Type,
                                    subscript jsonSubscriptpath: [JSONSubscriptType]? = nil,
                                    completion: ((_ result: Swift.Result<C, ApiError>) -> Void)?) {
        
        guard let filepath = Bundle.main.path(forResource: name, ofType: nil) else {
            log.error("file could't find from Bundle")
            return
        }
        guard let completion = completion else { return }
        let url = URL(fileURLWithPath: filepath)
        do {
            let data = try Data(contentsOf: url)
            let model = try data.decode(C.self, subscript: jsonSubscriptpath)
            completion(.success(model))
        } catch let error {
            completion(.failure(.jsonDecodingError(error: error)))
        }
    }
    
    public func request<C: Codable>(_ token: ApiConfigure,
                                      mapping: C.Type,
                                      subscript jsonSubscriptpath: [JSONSubscriptType]? = nil,
                                      callbackQueue: DispatchQueue = .main,
                                      completion: ((_ result: Swift.Result<C, ApiError>) -> Void)?) {
        return reqeustData(token)
              .decode(mapping: mapping,
                      subscript: jsonSubscriptpath,
                      callbackQueue: callbackQueue,
                      completion: completion)
    }
    
    public func request(_ token: ApiConfigure,
                          callbackQueue: DispatchQueue = .main,
                          completion: ((_ result: Swift.Result<JSON, ApiError>) -> Void)?) {
        return reqeustData(token)
            .decode(callbackQueue: callbackQueue,
                    completion: completion)
    }
    
    
    @discardableResult
    internal func reqeustData(_ token: ApiConfigure) -> DataRequest {
        return provider.request(token.defaultURLString,
                                method: token.route.method,
                            parameters: token.parameters,
                              encoding: token.parameterEncoding,
                               headers: token.httpHeaderFields)
    }
    
}

extension DataRequest {
    
    internal func response<C: Codable>(mapping: C.Type,
                                       subscript jsonSubscriptpath: [JSONSubscriptType]? = nil,
                                       callbackQueue: DispatchQueue = .main,
                                       completion: ((_ result: Swift.Result<C, ApiError>) -> Void)?) {
        validate(statusCode: 200...209)
            .responseData(queue: callbackQueue) { (obj) in
                guard let completion = completion else { return }
                switch obj.result {
                case .success(let json):
                    do {
                        let returnData = try json.decode(C.self, subscript: jsonSubscriptpath)
                        completion(.success(returnData))
                    } catch let error {
                        completion(.failure(.jsonDecodingError(error: error)))
                    }
                case .failure(let error):
                    log.error(error.localizedDescription)
                    if error._code == NSURLErrorTimedOut {
                        completion(.failure(.timeOut))
                    } else {
                        completion(.failure(.networkError(error: error)))
                    }
                }
        }
    }
    
    func decode(callbackQueue: DispatchQueue = .main,
                   completion: ((_ result: Swift.Result<JSON, ApiError>) -> Void)?) {
       validate(statusCode: 200...209)
           .responseData(queue: callbackQueue) { (obj) in
           guard let completion = completion else { return }
           switch obj.result {
           case .success(let data):
                completion(.success(JSON(data)))
           case .failure(let error):
               log.error(error.localizedDescription)
               if error._code == NSURLErrorTimedOut {
                   completion(.failure(.timeOut))
               } else {
                   completion(.failure(.networkError(error: error)))
               }
           }
       }
   }
   
   func decode<C: Codable>(mapping: C.Type,
                             subscript jsonSubscriptpath: [JSONSubscriptType]? = nil,
                             callbackQueue: DispatchQueue = .main,
                             completion: ((_ result: Swift.Result<C, ApiError>) -> Void)?) {
       validate(statusCode: 200...209)
           .responseData(queue: callbackQueue) { (obj) in
           guard let completion = completion else { return }
           switch obj.result {
           case .success(let json):
                do {
                    let returnData = try json.decode(C.self, subscript: jsonSubscriptpath)
                    completion(.success(returnData))
                } catch let error {
                    completion(.failure(.jsonDecodingError(error: error)))
                }
           case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    completion(.failure(.timeOut))
                } else {
                    completion(.failure(.networkError(error: error)))
                }
           }
       }
   }
}
