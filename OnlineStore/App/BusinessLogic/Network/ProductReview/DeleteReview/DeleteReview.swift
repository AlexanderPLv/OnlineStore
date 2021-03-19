//
//  DeleteReview.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

class DeleteReview {
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

extension DeleteReview: AbstractRequestFactory {
    typealias EndPoint = DeleteReviewResource
    func request(withCompletion completion: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {}
}

extension DeleteReview: DeleteReviewRequestFactory {
    func deleteReview(productId: String, completionHandler: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {
        let route = DeleteReviewResource(productId: productId)
        request(route, withCompletion: completionHandler)
    }

}
