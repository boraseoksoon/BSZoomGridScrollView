//
//  ShowingSelectedImageView.swift
//  BSZoomGridScrollViewSwiftUIExample
//
//  Created by Seoksoon Jang on 2019/11/19.
//  Copyright © 2019 Seoksoon Jang. All rights reserved.
//

import SwiftUI

struct ShowingSelectedImageView: View {
    @State var selectedImage: UIImage?
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
            
            Spacer()
            
            Image(uiImage: selectedImage ?? UIImage())
                .edgesIgnoringSafeArea(.all)
            
            Spacer()
        }
    }
}

struct ShowingSelectedImageView_Previews: PreviewProvider {
    static var previews: some View {
        ShowingSelectedImageView(selectedImage: UIImage())
    }
}
