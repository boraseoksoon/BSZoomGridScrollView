//
//  FetchItemUrlMakeable.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Combine

protocol FetchItemUrlMakeable {
    func makeFetchItemsComponents(page: Int?) -> URLComponents
}
