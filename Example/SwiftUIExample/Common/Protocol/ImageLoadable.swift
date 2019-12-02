//
//  ImageLoadable.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import Combine

protocol ImageLoadable {
    func loadImage(id: Int) -> AnyPublisher<UIImage, Error>
}
