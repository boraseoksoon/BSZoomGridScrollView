//
//  ImageLoader.swift
//  BSZoomGridScrollView
//
//  Created by boraseoksoon on 11/18/2019.
//  Copyright (c) 2019 boraseoksoon. All rights reserved.
//

import Combine
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published private(set) var image: UIImage? = nil
    
    public lazy var objectWillChange: AnyPublisher<UIImage?, Never> = {
        Empty().eraseToAnyPublisher()
    }()
    
    private let loadable: ImageLoadable
    private var cancellable: AnyCancellable?

    init(loadable: ImageLoadable, id: Int) {
        self.loadable = loadable

        self.objectWillChange = $image.handleEvents(
            receiveSubscription: { [weak self] sub in
                self?.load(id: id)
            },
            receiveCancel: { [weak self] in
                self?.cancellable?.cancel()
            }
        ).eraseToAnyPublisher()
    }
}

// MARK: - Private methods
extension ImageLoader {
    private func load(id: Int) {
        guard image == nil else {
            return
        }
        
        cancellable = loadable
            .loadImage(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] image in
                    self?.image = image
                }
            )
    }
}
