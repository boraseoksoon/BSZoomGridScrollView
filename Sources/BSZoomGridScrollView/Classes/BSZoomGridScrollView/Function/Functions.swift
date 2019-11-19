//
//  Functions.swift
//  BSZoomGridScrollView
//
//  Created by Jang seoksoon on 2019/11/19.
//
//  Copyright (c) 2019 Jang seoksoon <boraseoksoon@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation


// MARK: - Grand Central Dispatch Wrapper -
func MainQ(completion: @escaping () -> Void) {
    DispatchQueue.main.async {
        completion()
    }
}

func GlobalQ(threadName: String = Bundle.main.bundleIdentifier ?? "BSZoomGridScrollView",
             completion: @escaping () -> Void) {
    DispatchQueue.global().async {
        completion()
    }
}

let serialQueue = DispatchQueue(label: Bundle.main.bundleIdentifier ?? "BSZoomGridScrollView")
func SerialQ(completion: @escaping () -> Void) {
    serialQueue.async {
        completion()
    }
}

func Delay(_ delaySeconds: Double, completion: @escaping () -> Void) -> Void {
    DispatchQueue.main.asyncAfter(deadline: .now() + delaySeconds) {
        completion()
    }
}

#if os(iOS)
import UIKit
// MARK: - Utility
///
func GetRootViewController() -> UIViewController? {
    let keyWindow = UIApplication.shared.connectedScenes
      .filter({$0.activationState == .foregroundActive})
      .map({$0 as? UIWindowScene})
      .compactMap({$0})
      .first?.windows
      .filter({$0.isKeyWindow}).first
    return keyWindow?.rootViewController
}

func RandomEmoji() -> String {
    let range = 0x1F300...0x1F3F0
    let index = Int(arc4random_uniform(UInt32(range.count)))
    let ord = range.lowerBound + index
    guard let scalar = UnicodeScalar(ord) else { return "❓" }
    return String(scalar)
}

#endif
