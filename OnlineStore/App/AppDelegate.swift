//
//  AppDelegate.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 09.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let signIn = requestFactory.makeSignInRequestFactory()
        signIn.login(userName: "Somebody", password: "mypassword") { (response) in
            switch response {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error)
            }
        }
        
        let signUp = requestFactory.makeSignUpRequestFactory()
        signUp.signUp(idUser: "123", userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { (response) in
            switch response {
            case .success(let signUp):
                print(signUp)
            case .failure(let error):
                print(error)
            }
        }
        
        let logout = requestFactory.makeLogoutRequestFactory()
        logout.logout(userId: "123") { (response) in
            switch response {
            case .success(let logout):
            print(logout)
            case .failure(let error):
            print(error)
            }
        }
        
        let changeUser = requestFactory.makeChangeUserFactory()
        changeUser.changeUser(idUser: "123", username: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { (response) in
            switch response {
            case .success(let changeUser):
                print(changeUser)
            case .failure(let error):
                print(error)
            }
        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


}

