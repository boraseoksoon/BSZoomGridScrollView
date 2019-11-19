//
//  UIImage+Extension.swift
//  BSZoomGridScrollViewSwiftUIExample
//
//  Created by Seoksoon Jang on 2019/11/18.
//  Copyright © 2019 Seoksoon Jang. All rights reserved.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
