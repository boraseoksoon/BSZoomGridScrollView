//
//  Functions.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Combine

func ReplaceUrlResolution(from url: String,
                          targetWidth: String,
                          targetHeight: String) -> String {
    var copyUrl = url
    let components = copyUrl
        .components(separatedBy: "id/")
        
    if components.count > 1 {
        let subComponents = components[1]
            .components(separatedBy:"/")
        
        if subComponents.count >= 3 {
           let sourceWidth = subComponents[1]
           let sourceHeight = subComponents[2]
        
            copyUrl = copyUrl
                .replacingOccurrences(of: sourceWidth,
                                      with: targetWidth)
            copyUrl = copyUrl
                .replacingOccurrences(of: sourceHeight,
                                      with: targetHeight)
            
        } else {
            return url
        }
    } else {
        return url
    }
    
    return copyUrl
}
