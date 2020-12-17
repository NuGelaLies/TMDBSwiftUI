//
//  MappingJSON.swift
//  RxHeadlines
//
//  Created by NuGelaLies on 2019/7/29.
//  Copyright © 2019 NuGelaLies. All rights reserved.
//

import Foundation
import CleanJSON
import SwiftyJSON
protocol MappingJSON {}

extension MappingJSON {

    func decode<T: Codable>(_: T.Type, subscript subscirtpath: [JSONSubscriptType]? = nil, using decoder: CleanJSONDecoder = .init()) throws -> T {
        var json  = JSON(self)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let subscirtpath = subscirtpath {
            json = json[subscirtpath]
        }
        do {
            let data = try json.rawData()
            return try decoder.decode(T.self, from: data)
        } catch let error {
            throw error
        }
    }
}

extension JSON {
    func decode<T: Codable>(_: T.Type, subscript subscirtpath: [JSONSubscriptType]? = nil, using decoder: CleanJSONDecoder = .init()) throws -> T {
        var copy = self
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            if let subscirtpath = subscirtpath {
                copy = copy[subscirtpath]
            }
            let data = try copy.rawData()
            return try decoder.decode(T.self, from: data)
        } catch let error {
            throw error
        }
        
    }
}

extension String {
    func decode<T: Codable>(_: T.Type, subscript subscirtpath: [JSONSubscriptType]? = nil, using decoder: CleanJSONDecoder = .init()) throws -> T {
        let copy = self
        guard let data = copy.data(using: .utf8) else {
            throw ApiError.error(code: 100000, message: "string is inValid")
        }
        return try data.decode(T.self, subscript: subscirtpath, using: decoder)
    }
}


extension Data: MappingJSON {}

extension Array: MappingJSON {}

extension Dictionary: MappingJSON {}
