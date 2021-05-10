//
//  UserProfileCell.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 25.03.2021.
//

import UIKit

class UserProfileCell: UITableViewCell, ReusableView {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 18)
        label.contentMode = .left
        return label
    }()
    
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.contentMode = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor,
                          bottom: bottomAnchor, right: nil,
                          paddingTop: 8, paddingLeft: 8,
                          paddingBottom: 8, paddingRight: 0,
                          width: 100, height: 0)
        addSubview(infoLabel)
        infoLabel.anchor(top: topAnchor, left: titleLabel.rightAnchor,
                         bottom: bottomAnchor, right: rightAnchor,
                         paddingTop: 8, paddingLeft: 8,
                         paddingBottom: 8, paddingRight: 20,
                         width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(titleText: String, infoText: String) {
        titleLabel.text = titleText
        infoLabel.text = infoText
    }
    
}
