//
//  URL+Extension.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Foundation
import Combine

extension URL: ImageLoadable {
    enum ImageLoadingError: Error {
        case incorrectData
    }

    func loadImage(id: Int) -> AnyPublisher<UIImage, Error> {
        if let retrieveImage = self.retrieveImage(forKey: "\(id)") {
            return retrieveImage.loadImage(id: id)
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: self)
            .tryMap { data, _ in
                guard let image = UIImage(data: data) else {
                    throw ImageLoadingError.incorrectData
                }
                
                self.store(image: image, forKey: "\(id)")
                return image
            }
            .eraseToAnyPublisher()
    }
    
    private func store(image: UIImage, forKey key: String) {
        if let pngRepresentation = image.pngData() {
            UserDefaults.standard.set(pngRepresentation, forKey: key)
        }
    }
    
    private func retrieveImage(forKey key: String) -> UIImage? {
        guard let imageData = UserDefaults.standard.object(forKey: key) as? Data,
            let image = UIImage(data: imageData) else {
            return nil
        }
        return image
    }
}

