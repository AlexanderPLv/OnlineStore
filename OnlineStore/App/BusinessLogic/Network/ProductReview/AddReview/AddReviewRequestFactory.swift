//
//  AddReviewRequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

protocol AddReviewRequestFactory {
    func addReview(userName: String, ratingValue: Int, text: String, completionHandler: @escaping (Result<IsSuccess, NetworkingError>) -> Void)
}
