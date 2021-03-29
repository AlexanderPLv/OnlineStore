//
//  CustomNavigationController.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 20.03.2021.
//

import UIKit


class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

