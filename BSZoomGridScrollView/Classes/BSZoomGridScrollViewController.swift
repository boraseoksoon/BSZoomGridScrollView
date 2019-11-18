//
//  BSZoomGridScrollViewController.swift
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


///
/// Although it is strongly intended and designed to be used for SwiftUI base project,
/// You can use BSZoomGridBaseView in UIKit easily.
/// To use BSZoomGridUIScrollView(UIScrollView base) in a UIViewController of UIKit project,
/// Please, Follow steps written in the comments with Icon that will help you pay attention like 😀.
///
import UIKit

///
/// 😁 #Step1: Inherits BSZoomGridBaseViewController in order to inject constructor including instances variables,
/// It does not do any important tasks.
/// So, you can ignore inheritance. By doing so, however, currently you can't change configuration.
public final class BSZoomGridScrollViewController: BSZoomGridBaseViewController {
    ///
    /// 🤔 #Step2: These buttons are not a mandatory,
    /// but it will help us scroll up and down in the grid scroll view.
    
    // MARK: - Instance Variables
    ///
    
    /// To programmtically scroll up and down, both two buttons are used.
    /// target & action is wrapped by closure.
    /// FYI: UIControl+Extension
    private lazy var upButton: UIButton = { [unowned self] in
        let b = UIButton()
        b.frame = CGRect(x: UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.20),
                              y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 0.25),
                              width: BSZoomGridUIScrollView.ICON_WIDTH,
                              height: BSZoomGridUIScrollView.ICON_WIDTH)
        
        b.backgroundColor = .white
        b.setBackgroundImage(UIImage(systemName: "arrow.up.circle.fill"),
                                  for: .normal)
        b.tintColor = .black
        b.layer.cornerRadius = b.frame.size.width / 2.0
        b.clipsToBounds = true
         
        b.take(for: .touchUpInside) { [unowned self] in
            guard self.scrollViewContentOffsetY >= 0 + self.chunk
                else {
                    return
            }

            let point = CGPoint(x: 0, y: self.scrollViewContentOffsetY - self.chunk)
            self.zoomGridScrollView.setContentOffset(point, animated: true)
        }
        
        return b
    }()
    
    private lazy var downButton: UIButton = { [unowned self] in
        let b = UIButton()
        b.frame = CGRect(x: UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.20),
                              y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 0.15),
                              width: BSZoomGridUIScrollView.ICON_WIDTH,
                              height: BSZoomGridUIScrollView.ICON_WIDTH)
        
        b.backgroundColor = .white
        b.setBackgroundImage(UIImage(systemName: "arrow.down.circle.fill"),
                                  for: .normal)
        b.tintColor = .black
        b.layer.cornerRadius = b.frame.size.width / 2.0
        
        b.clipsToBounds = true

        b.take(for: .touchUpInside) { [unowned self] in
            guard self.scrollViewContentOffsetY <= self.scrollViewContentHeight - self.chunk
                else {
                    return
            }

            let point = CGPoint(x: 0, y: self.scrollViewContentOffsetY + self.chunk)
            self.zoomGridScrollView.setContentOffset(point, animated: true)
        }
        
        return b
    }()
    
    /// Helper instance variables
    var chunk: CGFloat {
        self.zoomGridScrollView.contentSize.height / 4.0
    }
    
    var scrollViewContentHeight: CGFloat {
        self.zoomGridScrollView.contentSize.height
    }
    
    var scrollViewContentOffsetY: CGFloat {
        self.zoomGridScrollView.contentOffset.y
    }
    
    ///
    /// 😊 #Step3: Init BSZoomGridUIScrollView, ready to use!
    private lazy var zoomGridScrollView: BSZoomGridUIScrollView = { [unowned self] in
        return BSZoomGridUIScrollView(parentView: self.view,
                                      imagesToZoom: self.imagesToZoom,
                                      powerOfZoomBounce: self.powerOfZoomBounce,
                                      numberOfColumns: self.numberOfColumns,
                                      numberOfRows: self.numberOfRows,
                                      didLongPressItem: self.didLongPressItem,
                                      didFinishDraggingOnItem: self.didFinishDraggingOnItem)
    }()
    
    // MARK: - View LifeCycle Methods
    ///
    override public func viewDidLoad() {
        super.viewDidLoad()

        ///
        /// 😎 # Step4: That's it. well done!
        /// Add all views created so far.
        self.view.addSubview(self.zoomGridScrollView)
        self.view.addSubview(self.upButton)
        self.view.addSubview(self.downButton)
    }
}
