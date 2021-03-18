//
//  DeleteReviewResource.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 18.03.2021.
//

import Foundation

struct DeleteReviewResource: EndPointType {
    typealias ModelType = IsSuccess
    var host: BaseURL = .apiRequest
    var path: Path = .deleteReview
    var httpMethod: HTTPMethod = .delete
    var parameters: Parameters
    
 
    
}
