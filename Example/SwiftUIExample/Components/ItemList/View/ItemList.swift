//
//  ItemList.swift
//  BSZoomGridScrollView
//
//  Created by boraseoksoon on 11/18/2019.
//  Copyright (c) 2019 boraseoksoon. All rights reserved.
//

import SwiftUI

struct ItemList: View {
    @ObservedObject var viewModel: ItemListViewModel
    
    init(viewModel: ItemListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            listView
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(title: Text(viewModel.errorMessage))
        }
    }
}

// MARK: - Views
extension ItemList {
    var listView: some View {
        List(viewModel.items, id: \.id) { item in
            ItemRow(item: item).onAppear {
                self.viewModel.appearItem(id:item.id)
            }
        }
        .navigationBarTitle(Text("Photos"))
    }
}
