//
//  ReusableCell.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 25.03.2021.
//

import Foundation

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
