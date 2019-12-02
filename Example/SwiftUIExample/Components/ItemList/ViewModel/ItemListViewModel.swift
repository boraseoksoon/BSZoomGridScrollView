//
//  ItemListViewModel.swift
//  BSZoomGridScrollView
//
//  Created by boraseoksoon on 11/18/2019.
//  Copyright (c) 2019 boraseoksoon. All rights reserved.
//

import Combine
import SwiftUI

class ItemListViewModel: ObservableObject {
    @Published var items: [Photo] = []
    @Published var showingAlert: Bool = false
    @Published var errorMessage: String = ""
        
    private let itemId = PassthroughSubject<Int?, CombineNetworkError>()
    private var cancellables = Set<AnyCancellable>()
    
    private var _images: [UIImage] = []
    public var images: [UIImage] {
        get {
            return _images
        }
        set {
            _images = newValue
        }
    }

    init(model: ItemListModel = ItemListModel(network: CombineNetwork())) {
        self.bind(to: model)
    }
}

// MARK: - Public methods
extension ItemListViewModel {
    public func appearItem(id: Int?) -> Void {
        guard let id = id else { return }
        self.itemId.send(id)
    }
}

// MARK: - Private methods
extension ItemListViewModel {
    private func bind(to model: ItemListModel) {
        itemId
            .map { model.getPage(items: self.items, id: $0) }
            .filter { $0 != nil }
            .eraseToAnyPublisher()
            .prepend(nil)
            .flatMap(model.fetchItems)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {
                    guard case .failure(let error) = $0 else { return }
                    self.items = []
                    self.showingAlert = true
                    self.errorMessage = error.message ?? "Unknown error"
                },
                receiveValue:  { items in
                    self.items += items
                    
                    self.downloadImages(from:items)
                }
            )
            .store(in: &cancellables)
    }
    
    private func downloadImages(from items: [Photo]) -> Void {
        DispatchQueue.global().async {
            items.forEach { item in
                URL(string: item.imageURL ?? "")?
                    .loadImage(id: item.id)
                    .receive(on: DispatchQueue.main)
                    .sink(
                        receiveCompletion: { _ in },
                        receiveValue: { [weak self] image in
                            DispatchQueue.main.async {
                                self?.images.append(image)
                            }
                        }
                    )
                    .store(in: &self.cancellables)
            }
        }
    }
}
