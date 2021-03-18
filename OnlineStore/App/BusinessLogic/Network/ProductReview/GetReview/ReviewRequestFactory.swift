//
//  ReviewRequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

protocol ReviewRequestFactory {
    func getReview(productId: String, completionHandler: @escaping (Result<Review, NetworkingError>) -> Void)
}
