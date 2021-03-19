//
//  Review.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

class ProductReview {
    let sessionManager: URLSession
    let serializer: DecodableSerializer<EndPoint.ModelType>
    let encoder: ParameterEncoder
    init(
        serializer: DecodableSerializer<EndPoint.ModelType>,
        encoder: ParameterEncoder,
        sessionManager: URLSession) {
        self.encoder = encoder
        self.serializer = serializer
        self.sessionManager = sessionManager
    }
}

extension ProductReview: AbstractRequestFactory {
    typealias EndPoint = ReviewResource
    func request(withCompletion completion: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {}
}

extension ProductReview: ReviewRequestFactory {
    func getReview(productId: String, completionHandler: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {
        let route = ReviewResource(productId: productId)
        request(route, withCompletion: completionHandler)
    }
}

