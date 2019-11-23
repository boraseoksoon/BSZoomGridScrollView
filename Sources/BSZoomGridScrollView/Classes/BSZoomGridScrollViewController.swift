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

#if os(iOS)
import UIKit

///
/// 😁 #Step1: Inherits BSZoomGridBaseViewController in order to inject constructor including instances variables,
/// Actually, it does not do any important tasks.
/// So, you can ignore inheritance. By doing so, however, currently you can't change configuration.
public final class BSZoomGridScrollViewController: BSZoomGridBaseViewController {
    ///
    /// 🤔 #Step2: These buttons are not a mandatory,
    /// but it will help us scroll up and down in the grid scroll view.
    
    // MARK: - Instance Variables
    ///
    
    /// To programmtically disable scroll view,
    /// target & action is wrapped by closure.
    /// FYI: UIControl+Extension
    private lazy var disableOrNotButton: UIButton = { [unowned self] in
        let b = UIButton()
        b.frame = CGRect(x: UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.25),
                              y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 0.25),
                              width: BSZoomGridUIScrollView.ICON_WIDTH,
                              height: BSZoomGridUIScrollView.ICON_WIDTH)
                
        b.setBackgroundImage(UIImage(systemName: "circle"),
                                  for: .normal)
        
        b.setBackgroundImage(UIImage(systemName: "circle.fill"),
                             for: .highlighted)
        
        b.tintColor = self.scrollEnableButtonTintColor
        b.backgroundColor = self.scrollEnableButtonBackgroundColor
        
        b.layer.cornerRadius = b.frame.size.width / 2.0
        b.clipsToBounds = true
         
        b.take(for: .touchUpInside) { [unowned self] in
            self.zoomGridScrollView.isScrollEnabled = !self.zoomGridScrollView.isScrollEnabled
            
            self.showToast(
                message: self.zoomGridScrollView.isScrollEnabled
                    ? "Scroll enabled. \(RandomEmoji())" : "Scroll locked. \(RandomEmoji())",
                font: .boldSystemFont(ofSize: 16)
            )
        }
        
        return b
    }()
    
    ///
    /// 😊 #Step3: Init BSZoomGridUIScrollView, ready to use!
    private lazy var zoomGridScrollView: BSZoomGridUIScrollView = { [unowned self] in
        return BSZoomGridUIScrollView(parentView: self.view,
                                      itemsToZoom: self.itemsToZoom,
                                      powerOfZoomBounce: self.powerOfZoomBounce,
                                      numberOfColumns: self.numberOfColumns,
                                      numberOfRows: self.numberOfRows,
                                      isBeingDraggingOnItem: self.isBeingDraggingOnItem,
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
        self.view.addSubview(self.disableOrNotButton)
    }
    
}

// MARK: - Public Methods
///
extension BSZoomGridScrollViewController {
    /// Refresh and redraw array items in the grid
    ///
    /// - Parameters:
    ///   - compositingOperation: The compositing operation of creating image.
    ///   - alpha: The alpha should be used for image.
    ///   - backgroundColor: The background color for the output image.
    /// - Returns: An image with compositing operation applied.
    ///
    /// - Note: This method only works for CG-based image. For any non-CG-based image, `base` itself is returned.
    
    public func refresh(_ itemsToZoom: [Any]) -> Void {
        self.zoomGridScrollView.refresh(itemsToZoom)
    }
}
#endif
