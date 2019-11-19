//
//  ContentView.swift
//  BSZoomGridScrollViewSwiftUIExample
//
//  Created by Seoksoon Jang on 2019/11/18.
//  Copyright © 2019 Seoksoon Jang. All rights reserved.
//

/// To use BSZoomGridScrollView in a SwiftUI project,
/// Please, Follow steps written in the comments with Icon that will help you pay attention like 😀.

import SwiftUI

/// 🥳 # Step1: let's import!
import BSZoomGridScrollView

struct ContentView: View {
    @State var showSelectedImageView = false
    @State var selectedImage: UIImage?

    var itemsToZoom: [Any] = {
        var images = [UIImage]()
        for i in 0...29 {
            images.append(UIImage(named: "s\(i)") ?? UIImage())
        }
        return images
    }()
    
    var body: some View {
        /// 😊 # Step2. That's it. completed!
        BSZoomGridScrollView(itemsToZoom: itemsToZoom,
                             powerOfZoomBounce: .regular,
                             scrollEnableButtonTintColor: .blue,
                             scrollEnableButtonBackgroundColor: .black,
                             isBeingDraggingOnItem:{ selectedImage in
                                ///
                             },
                             didLongPressItem: { selectedImage in
                                /// Grab an image user end up choosing.
                                print("on long press : ", selectedImage)
                                self.selectedImage = selectedImage
                                
                                /// Present!
                                self.showSelectedImageView.toggle()
                             },
                             didFinishDraggingOnItem: { selectedImage in
                                /// Grab an image user end up choosing.
                                print("on drag finish : ", selectedImage)
        })
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented:self.$showSelectedImageView) {
            /// The example view showing a picked up image.
            ShowingSelectedImageView(selectedImage: self.selectedImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
