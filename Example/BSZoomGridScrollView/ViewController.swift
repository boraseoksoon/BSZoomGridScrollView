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
    // 😋 #Step2: declare BSZoomGridScrollView
    ///
    private lazy var zoomGridScrollViewController: BSZoomGridScrollViewController = { [unowned self] in
        ///
        /// It can be used on both SwiftUI and UIKit.
        /// To see how it works on SwiftUI,
        /// please refer to comments in SwiftUI directory -> ContentView.swift
        ///
        return BSZoomGridScrollViewController(imagesToZoom: imagesToZoom,
                                              powerOfZoomBounce: .crazy,
                                              numberOfColumns: 70,
                                              numberOfRows: 25,
                                              scrollEnableButtonTintColor: .red,
                                              scrollEnableButtonBackgroundColor: .black,
                                              didLongPressItem: { selectedImage in
                                                print("on long press : ", selectedImage)
                                                /// Grab an image user end up choosing.
                                                
                                                // Present the example view containing a selected image.
                                                let v = ShowingSelectedImageView(selectedImage: selectedImage)
                                                let vc = UIHostingController(rootView: v)
                                                
                                                self.presentedViewController?
                                                    .present(vc, animated: true, completion: nil)
                                                
                                              },
                                              didFinishDraggingOnItem: { selectedImage in
                                                print("on drag finish : ", selectedImage)
                                              })
    }()
    
    ///
    // prepare any item array to feed to BSZoomGridScrollViewController.
    ///
    private var imagesToZoom: [UIImage] = {
        var images = [UIImage]()
        for i in 0...29 {
            images.append(UIImage(named: "s\(i)") ?? UIImage())
        }
        return images
    }()
    
    ///
    // 😁 #Step3: Present it!
    ///
    @IBAction func goToBSZoomGridScrollView(_ sender: Any) {
        ///
        // 😎 That's all. well done.
        ///
        self.present(zoomGridScrollViewController,
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

