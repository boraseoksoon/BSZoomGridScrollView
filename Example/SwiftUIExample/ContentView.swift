//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var ItemListViewModel: ItemListViewModel
    
    init(ItemListViewModel: ItemListViewModel) {
        self.ItemListViewModel = ItemListViewModel
    }
    
    var body: some View {
        TabView {
            ItemList(viewModel: ItemListViewModel)
                .tabItem {
                    Image(systemName:"safari")
                    Text("Photos")
                }
            
            GridView(viewModel: ItemListViewModel)
                .tabItem {
                    Image(systemName: "grid")
                    Text("Grid")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
