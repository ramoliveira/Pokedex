//
//  Network.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import Combine
import SwiftUI
import Foundation

public struct Network {
    enum Error: Swift.Error {
        case invalidURL
        case nullURL
        case badServerResponse
        case failedToFetchImage
    }
    
    private var url: URL
    private var urlSession: URLSession
    
    public init(_ url: URL, urlSession: URLSession = URLSession.shared) {
        self.url = url
        self.urlSession = urlSession
    }
    
    public func request<T: Decodable>(_ objectType: T.Type) -> AnyPublisher<T, Swift.Error> {
        urlSession
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
//    public func requestImage() -> AnyPublisher<UIImage, Swift.Error> {
//        urlSession
//            .dataTaskPublisher(for: url)
//            .map { UIImage(data: $0.data) }
//            .replaceNil(with: UIImage())
//            .mapError({ _ in Error.failedToFetchImage })
//            .eraseToAnyPublisher()
//    }
    
    public func requestImage() -> AnyPublisher<Image, Swift.Error> {
        urlSession
            .dataTaskPublisher(for: url)
            .map { Image(uiImage: UIImage(data: $0.data) ?? UIImage()) }
            .replaceNil(with: Image(systemName: "square"))
            .mapError({ _ in Error.failedToFetchImage })
            .eraseToAnyPublisher()
    }
}
