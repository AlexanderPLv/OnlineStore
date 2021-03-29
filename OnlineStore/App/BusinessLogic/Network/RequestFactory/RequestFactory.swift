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
        let serializer = DecodableSerializer<Token>()
        let encoder = JSONParameterEncoder()
        return SignIn(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }
    
    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let serializer = DecodableSerializer<IsSuccess>()
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
    
    func makePostReviewRequestFactory() -> PostReviewRequestFactory {
        let serializer = DecodableSerializer<IsSuccess>()
        let encoder = JSONParameterEncoder()
        return PostReview(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }

    func makeDeleteReviewRequestFactory() -> DeleteReviewRequestFactory {
        let serializer = DecodableSerializer<IsSuccess>()
        let encoder = URLPathParameterEncoder()
        return DeleteReview(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }
    
    func makeGetUserDataFactory() -> GetUserDataFactory {
        let serializer = DecodableSerializer<UserProfile>()
        let encoder = JSONParameterEncoder()
        return GetUserData(serializer: serializer, encoder: encoder, sessionManager: commonSession)
    }
}
