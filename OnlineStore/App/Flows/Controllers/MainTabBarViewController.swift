//
//  MainTabBarViewController.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 20.03.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBar.barTintColor = .none
        tabBar.alpha = 0.5
        tabBar.tintColor = .black
        setupViewControllers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Session.shared.token == nil {
                    DispatchQueue.main.async {
                        let login = SignInViewController()
                        login.modalPresentationStyle = .fullScreen
                        self.present(login, animated: true, completion: nil)
                    }
                    return
                }
    }

    func setupViewControllers() {
        let userProfileViewController = templateNavController(systemImageString: "person.crop.square",
                                                              rootViewController: UserProfileController())
        
        viewControllers = [
            userProfileViewController
            ]

        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }

    fileprivate func templateNavController(systemImageString: String,
                                           rootViewController: UIViewController = UIViewController()) -> CustomNavigationController {
        let viewController = rootViewController
        let navController = CustomNavigationController(rootViewController: viewController)
        navController.navigationBar.barTintColor = #colorLiteral(red: 0.9435791373, green: 0.6045697927, blue: 0.2109713256, alpha: 1)
        
        let imageConfig = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: systemImageString,
                            withConfiguration: imageConfig)
        navController.tabBarItem.image = image
        
        return navController
    }

}

