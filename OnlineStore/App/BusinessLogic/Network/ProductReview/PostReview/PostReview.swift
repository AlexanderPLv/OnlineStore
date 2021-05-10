//
//  AddReview.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

class PostReview {
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

extension PostReview: AbstractRequestFactory {
    typealias EndPoint = PostReviewResource
    func request(withCompletion completion: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {}
}

extension PostReview: PostReviewRequestFactory {
    func addReview(userName: String, ratingValue: Int, text: String, completionHandler: @escaping (Result<[EndPoint.ModelType], NetworkingError>) -> Void) {
        let route = PostReviewResource(userName: userName, ratingValue: ratingValue, text: text)
        request(route, withCompletion: completionHandler)
    }

}
