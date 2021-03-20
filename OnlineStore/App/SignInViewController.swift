//
//  SignInViewController.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 20.03.2021.
//

import UIKit

class SignInViewController: UIViewController {
    

    
    var logoView: UIView = {
       let view = UIView()
        view.backgroundColor = .none
        
        let logoImage = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        logoImage.contentMode = .scaleAspectFill
        
        view.addSubview(logoImage)
        logoImage.centerYInSuperview()
        logoImage.centerXInSuperview()
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    @objc func handleTextInputChange() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0
        
        if isFormValid {
            signInButton.isEnabled = true
            signInButton.backgroundColor = .black
        } else {
            signInButton.isEnabled = false
            signInButton.backgroundColor = .darkGray
        }
    }
    
    lazy var dontHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't have an account?  ", for: .normal)
        button.backgroundColor = UIColor(white: 0, alpha: 0)
        
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
        
        button.isEnabled = true
        
        return button
    }()
    
    @objc private func goToSignUp() {
        let signUpController = SignUpViewController()
        navigationController?.present(signUpController, animated: true)
    }
    
    
    lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGN IN", for: .normal)
        button.backgroundColor = .lightGray
        
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        button.isEnabled = false
        
        return button
    }()
    
    @objc func handleLogin() {
//        guard let email = emailTextField.text else { return }
//        guard let password = passwordTextField.text else { return }
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = #colorLiteral(red: 0.9505988955, green: 0.6414991021, blue: 0.2109509408, alpha: 1)
        
        view.addSubview(logoView)
        logoView.anchor(top: view.topAnchor, left: view.leftAnchor,
                        bottom: nil, right: view.rightAnchor,
                        paddingTop: 0,paddingLeft: 0, paddingBottom: 0, paddingRight: 0,
                        width: 0, height: view.frame.height / 3)
        
        setupInputFields()
        
    }
    
    
    fileprivate func setupInputFields() {
        let stackView = VerticalStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField,
            signInButton,
            dontHaveAnAccountButton
        ], spacing: 10 )
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: logoView.bottomAnchor, left: view.leftAnchor,
                         bottom: nil,right: view.rightAnchor,
                         paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 40,
                         width: 0, height: 140)
    }
    
}
