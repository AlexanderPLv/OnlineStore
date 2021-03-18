//
//  ReviewResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

struct ReviewResource: EndPointType {
    typealias ModelType = Review
    let host      : BaseURL = .apiRequest
    let path      : Path = .getReview
    let httpMethod: HTTPMethod = .get
    let productId : String
    var parameters: Parameters {
        [
      "productId" : productId
        ]
    }
    
    
    
    
    
}
