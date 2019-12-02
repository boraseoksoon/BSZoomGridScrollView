//
//  Photo.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Combine

struct Photo: GenericItem, Codable, Identifiable {
    let id: Int
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
    
    let name: String?
    let imageURL: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url, download_url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        let id = try values.decode(String.self, forKey: .id)
        self.id = Int(id) ?? -1
        
        self.author = try values.decode(String.self, forKey: .author)
        self.width = try values.decode(Int.self, forKey: .width)
        self.height = try values.decode(Int.self, forKey: .height)
        self.url = try values.decode(String.self, forKey: .url)
        self.download_url = try values.decode(String.self, forKey: .download_url)
        
        self.name = self.author
        self.imageURL = ReplaceUrlResolution(from: self.download_url,
                                             targetWidth: "120",
                                             targetHeight: "120")
        
        self.description = "\(String(self.width)) * \(String(self.height))"
    }
}
