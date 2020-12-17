//
//  ApiResoonseData.swift
//  HeadlineNews
//
//  Created by NuGelaLies on 2019/6/26.
//  Copyright © 2019 Sing Tao Limited. All rights reserved.
//

import Foundation

struct ReturnData<T: Codable>: Codable {
    var result: Int = 0
    var data: T
}
