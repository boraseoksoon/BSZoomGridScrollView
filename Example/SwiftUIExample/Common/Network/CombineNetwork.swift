//
//  Network.swift
//  SwiftUIExample
//
//  Created by Seoksoon Jang on 2019/12/02.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Combine

class CombineNetwork {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - Fetchable
extension CombineNetwork: Fetchable {
    func fetchItems(page: Int?) -> AnyPublisher<[Photo], CombineNetworkError> {
        guard let url = makeFetchItemsComponents(page: page).url else {
            return makeErrorPublisher(msg: "invalid Url")
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { .error($0.localizedDescription) }
            .flatMap { response in
                Just(response.data)
                    .decode(type: [Photo].self, decoder: JSONDecoder())
                    .mapError { .error($0.localizedDescription) }
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - FetchItemUrlMakeable
extension CombineNetwork: FetchItemUrlMakeable {
    struct apiUrl {
        static let scheme = "https"
        static let host = "picsum.photos"
        static let path = "/v2/list"
    }

    func makeFetchItemsComponents(page: Int?) -> URLComponents {
        var components = URLComponents()
        components.scheme = apiUrl.scheme
        components.host = apiUrl.host
        components.path = apiUrl.path

        if let page = page {
            components.queryItems = [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "limit", value: "200")
            ]
        } else {
            components.queryItems = [
                URLQueryItem(name: "limit", value: "200")
            ]
        }

        return components
    }
}

// MARK: - Private Methods
extension CombineNetwork {
    private func makeErrorPublisher(msg: String) -> AnyPublisher<[Photo], CombineNetworkError> {
        Fail(error: CombineNetworkError.error(msg)).eraseToAnyPublisher()
    }
}
