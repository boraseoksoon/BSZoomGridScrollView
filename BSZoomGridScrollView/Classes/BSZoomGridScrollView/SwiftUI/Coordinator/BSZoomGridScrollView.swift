//
//  BSZoomGridScrollView.swift
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

import SwiftUI
import UIKit

struct BSZoomGridScrollView: UIViewControllerRepresentable {
    let imagesToZoom: [UIImage]
    var powerOfZoomBounce: ZoomBounceRatio
    var numberOfColumns: Int
    var numberOfRows: Int

    var didLongPressItem: ((_: UIImage) -> Void)?
    var didFinishDraggingOnItem: ((_: UIImage) -> Void)?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> BSZoomGridScrollViewController {
        let scrollViewController = BSZoomGridScrollViewController(imagesToZoom: imagesToZoom,
                                                                  powerOfZoomBounce: self.powerOfZoomBounce,
                                                                  numberOfColumns: self.numberOfColumns,
                                                                  numberOfRows: self.numberOfRows,
                                                                  didLongPressItem:self.didLongPressItem,
                                                                  didFinishDraggingOnItem:self.didFinishDraggingOnItem)
        return scrollViewController
    }

    func updateUIViewController(_ vc: BSZoomGridScrollViewController, context: Context) {
        //
    }

    class Coordinator: NSObject {
        var parent: BSZoomGridScrollView

        init(_ pageViewController: BSZoomGridScrollView) {
            self.parent = pageViewController
        }
    }
}

