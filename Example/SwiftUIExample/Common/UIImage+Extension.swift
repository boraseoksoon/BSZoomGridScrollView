//
//  UIImage+Extension.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import Combine

extension UIImage: ImageLoadable {
    func loadImage(id: Int) -> AnyPublisher<UIImage, Error> {
        return Just(self)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

