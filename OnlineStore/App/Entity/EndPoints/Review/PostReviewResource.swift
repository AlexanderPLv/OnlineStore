//
//  AddReviewResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

struct PostReviewResource: EndPointType {
    typealias ModelType = IsSuccess
    let host       : BaseURL = .apiRequest
    let path       : Path = .review
    let httpMethod : HTTPMethod = .post
    let userName   : String
    let ratingValue: Int
    let text       : String
    var parameters : Parameters {
        [
        "userName": userName,
        "ratingValue": ratingValue,
        "text": text
        ]
    }
    
    
    
    
}
