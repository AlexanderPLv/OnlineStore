//
//  DeleteReviewResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

struct DeleteReviewResource: EndPointType {
    typealias ModelType = IsSuccess
    let host      : BaseURL = .apiRequest
    let path      : Path = .review
    let httpMethod: HTTPMethod = .delete
    let productId : String
    var parameters: Parameters {
        [
       "productId": productId
        ]
    }
}
