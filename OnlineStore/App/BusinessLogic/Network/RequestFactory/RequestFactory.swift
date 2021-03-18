//
//  RequestFactory.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 12.02.2021.
//

import Foundation

class RequestFactory {
    
    lazy var commonSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        let manager = URLSession(configuration: configuration, delegate: nil, delegateQueue: .main)
        return manager
    }()
    
    func makeSignInRequestFactory() -> SignInRequestFactory {
        let serializer = DecodableSerializer<LoginResult>()
        let encoder = JSONParameterEncoder()
        return SignIn(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }
    
    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let serializer = DecodableSerializer<RegisterUser>()
        let encoder = JSONParameterEncoder()
        return SignUp(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let serializer = DecodableSerializer<IsSuccess>()
        let encoder = JSONParameterEncoder()
        return Logout(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }
    
    func makeChangeUserFactory() -> ChangeUserFactory {
        let serializer = DecodableSerializer<IsSuccess>()
        let encoder = JSONParameterEncoder()
        return ChangeUser(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }
    
    func makeReviewRequestFactory() -> ReviewRequestFactory {
        let serializer = DecodableSerializer<Review>()
        let encoder = URLPathParameterEncoder()
        return ProductReview(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }
    
    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let serializer = DecodableSerializer<IsSuccess>()
        let encoder = JSONParameterEncoder()
        return AddProductReview(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }

    
}
