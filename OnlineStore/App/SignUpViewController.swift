//
//  SignUpViewController.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 20.03.2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let userNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username*"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password*"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email*"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let genderTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Gender"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let creditCardTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Credit Card*"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let bioTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Bio"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    @objc func handleTextInputChange() {
        let isEmailValid = emailTextField.text?.count ?? 0 > 0
        let isPasswordValid = passwordTextField.text?.count ?? 0 > 0
        let isUsernameValid = userNameTextField.text?.count ?? 0 > 0
        let isPaymentInfoValid = creditCardTextField.text?.count ?? 0 > 0
        let isFormValid = isEmailValid && isPasswordValid && isUsernameValid && isPaymentInfoValid
        
        if isFormValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = .black
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = .darkGray
        }
    }
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN UP", for: .normal)
        button.backgroundColor = .lightGray
        
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(handleSignUP), for: .touchUpInside)
        
        button.isEnabled = false
        
        return button
    }()
    
    @objc private func handleSignUP() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BasicColor")
        
        setupInputFields()
    }
    
    
    fileprivate func setupInputFields() {
        let stackView = VerticalStackView(arrangedSubviews: [
            userNameTextField,
            passwordTextField,
            emailTextField,
            genderTextField,
            creditCardTextField,
            bioTextField,
            signUpButton
        ],
        spacing: 10)
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor,
                         bottom: nil, right: view.rightAnchor,
                         paddingTop: 50, paddingLeft: 40,
                         paddingBottom: 0, paddingRight: 40,
                         width: 0, height: 300)
    }
    
    
}
