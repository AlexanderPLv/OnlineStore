//
//  AddReview.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

class AddProductReview {
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

extension AddProductReview: AbstractRequestFactory {
    typealias EndPoint = AddReviewResource
    func request(withCompletion completion: @escaping (Result<EndPoint.ModelType, NetworkingError>) -> Void) {}
}

extension AddProductReview: AddReviewRequestFactory {
    func addReview(userName: String, ratingValue: Int, text: String, completionHandler: @escaping (Result<IsSuccess, NetworkingError>) -> Void) {
        let route = AddReviewResource(userName: userName, ratingValue: ratingValue, text: text)
        request(route, withCompletion: completionHandler)
    }

}
