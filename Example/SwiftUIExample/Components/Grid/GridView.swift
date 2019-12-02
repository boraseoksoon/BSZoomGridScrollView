//
//  GridView.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI
/// 🥳 # Step1: let's import!
import BSZoomGridScrollView

struct GridView: View {
    @ObservedObject var viewModel: ItemListViewModel
    
    @State var showSelectedImageView = false
    @State var selectedImage: UIImage?
    
    init(viewModel: ItemListViewModel) {
        self.viewModel = viewModel
    }
    
    /// from VM
    func itemsToZoom() -> [UIImage] {
        return self.viewModel.images
    }
    
    // generated static images
    var itemsToZoom2: [Any] = {
        var images = [UIImage]()
        for i in 0...1000 {
            images.append(UIImage(systemName: "smiley") ?? UIImage())
        }
        return images
    }()

    var body: some View {
        /// 😊 # Step2. That's it. completed!
        BSZoomGridScrollView(itemsToZoom: itemsToZoom(),
                             powerOfZoomBounce: .regular,
                             scrollEnableButtonTintColor: .blue,
                             scrollEnableButtonBackgroundColor: .black,
                             isBeingDraggingOnItem:{ draggingImage in
                                ///
                             },
                             didTapOnItem: { tapImage in
                                ///
                             },
                             didLongPressItem: { longPressedImage in
                               ///
                             },
                             didFinishDraggingOnItem: { draggedFinalImage in
                               ///
                             })
        .edgesIgnoringSafeArea(.all)
    }
}
