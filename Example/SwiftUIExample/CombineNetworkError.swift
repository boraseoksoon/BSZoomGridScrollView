//
//  CombineNetworkError.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

enum CombineNetworkError: Error {
    case error(String)
    case unknown(String)
    
    var message: String? {
        switch self {
            case .error(let msg):
                return msg
            case let .unknown(msg):
                return msg
        }
    }
}

