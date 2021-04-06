//
//  ViewController.swift
//  BSZoomGridScrollView
//
//  Created by boraseoksoon on 11/18/2019.
//  Copyright (c) 2019 boraseoksoon. All rights reserved.
//

///
/// To use BSZoomGridScrollView,
/// Please, Follow steps written in the comments with icon like 😀.
///

import SwiftUI
import UIKit

///
// 😚 #Step1: import BSZoomGridScrollView!
///
import BSZoomGridScrollView

class ViewController: UIViewController {
    ///
    // prepare any item array to feed to BSZoomGridScrollViewController.
    ///
    private var itemsToZoom: [Any] = {
        return (0...1500).compactMap { _ in UIImage(systemName: "smiley") }
    }()
    
    
    ///
    // 😋 #Step2: declare BSZoomGridScrollView
    ///
    private lazy var zoomGridScrollViewController: BSZoomGridScrollViewController = { [unowned self] in
        ///
        /// It can be used on both SwiftUI and UIKit.
        /// To see how it works on SwiftUI,
        /// please refer to comments in SwiftUI directory -> ContentView.swift
        ///
        return BSZoomGridScrollViewController(itemsToZoom: self.itemsToZoom,
                                              powerOfZoomBounce: .regular,
                                              scrollEnableButtonTintColor: .black,
                                              scrollEnableButtonBackgroundColor: .white,
                                              isBeingDraggingOnItem:{ [unowned self] selectedImage in
                                                 ///
                                              },
                                              didTapOnItem: { [unowned self] tapImage in
                                                 ///
                                              },
                                              didLongPressItem: { [unowned self] selectedImage in
                                                ///
                                              },
                                              didFinishDraggingOnItem: { [unowned self] selectedImage in
                                                ///
                                              })
    }()
    
    ///
    // 😁 #Step3: Present it!
    ///
    @IBAction func goToBSZoomGridScrollView(_ sender: Any) {
        ///
        // 😎 That's all. well done.
        ///
        
        self.present(UINavigationController(rootViewController: zoomGridScrollViewController),
                     animated: true,
                     completion: nil)
    }
    
    ///
    // MARK: - ViewController LifeCycle Methods
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

