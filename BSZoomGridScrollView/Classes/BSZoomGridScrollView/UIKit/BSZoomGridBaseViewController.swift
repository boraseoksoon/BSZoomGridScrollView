//
//  BSZoomGridBaseViewController.swift
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

import UIKit

public class BSZoomGridBaseViewController: UIViewController {
    // MARK: - Initializers
    /// Using constuctor Dependency Injection, all initialization should be done in the constructor.
    ///
    /// - Parameters:
    ///   - parentView: a parent view to add scrollView as subview
    ///   - itemsToZoom: item array in grid to be displayed such as [UIImage]
    ///                   if item numbers are not enough to fill the grid, it will be repeated until grid is fully drawn.
    ///   - powerOfZoomBounce: a value to be able to choose from enum four enumeration types
    ///   - numberOfRows: number of row to be applied in a row.
    ///   - didLongPressItem: closure that will indicates which UIImage is decided to be chosen, by a long touch.
    ///   - didFinishDraggingOnItem: closure that will indicates
    ///                              which UIImage is decided to be chosen, by a end of pan gesture touch.
    /// - Returns: Initializer
    public init(itemsToZoom: [Any],
                powerOfZoomBounce: ZoomBounceRatio,
                numberOfColumns: Int,
                numberOfRows: Int,
                scrollEnableButtonTintColor: UIColor = .black,
                scrollEnableButtonBackgroundColor: UIColor = .white,
                isBeingDraggingOnItem: ((_: UIImage) -> Void)?,
                didLongPressItem: ((_: UIImage) -> Void)?,
                didFinishDraggingOnItem: ((_: UIImage) -> Void)?) {
        /// Closures
        self.didLongPressItem = didLongPressItem
        self.didFinishDraggingOnItem = didFinishDraggingOnItem
        self.isBeingDraggingOnItem = isBeingDraggingOnItem
        
        self.itemsToZoom = itemsToZoom
        self.powerOfZoomBounce = powerOfZoomBounce

        super.init(nibName: nil, bundle: nil)

        self.numberOfColumns = numberOfColumns
        self.numberOfRows = numberOfRows
        self.scrollEnableButtonTintColor = scrollEnableButtonTintColor
        self.scrollEnableButtonBackgroundColor = scrollEnableButtonBackgroundColor
    }
    
    required public init?(coder: NSCoder) {
        fatalError("""
                init(coder:) has not been implemented.\n
                Creating BSZoomGridScrollViewController programmatically is only allowed.
        """)
    }
    
    // MARK: - Private Instance Variables
    /// private accessor goes here.
    internal private(set) var didLongPressItem: ((_: UIImage) -> Void)?
    internal private(set) var didFinishDraggingOnItem: ((_: UIImage) -> Void)?
    internal private(set) var isBeingDraggingOnItem: ((_: UIImage) -> Void)?
    
    internal private(set) var itemsToZoom: [Any]
    
    internal private(set) var powerOfZoomBounce: ZoomBounceRatio
    
    private var _scrollEnableButtonBackgroundColor: UIColor = .black
    internal var scrollEnableButtonBackgroundColor: UIColor {
        get {
            return _scrollEnableButtonBackgroundColor
        }
        set {
            _scrollEnableButtonBackgroundColor = newValue
        }
    }
    
    private var _scrollEnableButtonTintColor: UIColor = .black
    internal var scrollEnableButtonTintColor: UIColor {
        get {
            return _scrollEnableButtonTintColor
        }
        set {
            _scrollEnableButtonTintColor = newValue
        }
    }

    private var _numberOfColumns: CGFloat = 70.0
    internal private(set) var numberOfColumns: Int {
        get {
            return Int(_numberOfColumns)
        }
        set {
            _numberOfColumns = CGFloat(newValue)
        }
    }
    
    private var _numberOfRows: CGFloat = 30.0
    internal private(set) var numberOfRows: Int {
        get {
            return Int(_numberOfRows)
        }
        set {
            _numberOfRows = CGFloat(newValue)
        }
    }
}
