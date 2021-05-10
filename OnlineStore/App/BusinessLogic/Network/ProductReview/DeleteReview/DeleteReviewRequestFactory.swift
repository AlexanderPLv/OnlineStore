//
//  DeleteReviewRequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 19.03.2021.
//

import Foundation

protocol DeleteReviewRequestFactory {
    func deleteReview(productId: String, completionHandler: @escaping (Result<[IsSuccess], NetworkingError>) -> Void)
}
