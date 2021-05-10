//
//  ChangeUserDataController.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 28.03.2021.
//

import UIKit

protocol UserProfileControllerDelegate {
    func didEditUserData(data: [String])
}

class ChangeUserDataController: UIViewController {
    
    var delegate: UserProfileControllerDelegate?
    private let requestFactory = RequestFactory()
    private var dataToEdit: [String]
    private var index: Int
    private var editorTextView: UITextView = {
       let tf = UITextView()
       tf.font = UIFont.systemFont(ofSize: 16)
       tf.contentMode = .scaleToFill
       return tf
    }()
    
    init(dataToEdit: [String], index: Int) {
        self.dataToEdit = dataToEdit
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           setupNavigationButtons()
           view.backgroundColor = .white
           view.addSubview(editorTextView)
           editorTextView.fillSuperview(padding: .init(top: 8, left: 8,
                                                       bottom: 8, right: 8))
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           editorTextView.text = dataToEdit[index]
       }
    
    private func editData() {
        if let text = editorTextView.text {
            dataToEdit[index] = text
        }
    }
    
    fileprivate func setupNavigationButtons() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:
                                                            "Cancel",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(saveText))
    }
    
    @objc func saveText() {
        let request = requestFactory.makeChangeUserFactory()
        guard let token = Session.shared.token else { return }
        let userId = Session.shared.userId
        request.changeUser(userId: userId, token: token) { (response) in
            switch response {
            case .success(let response):
                print(response)
                self.editData()
                self.dismiss(animated: true) {
                    self.delegate?.didEditUserData(data: self.dataToEdit)
                }
            case .failure(let error):
                self.showAlert(with: error.localizedDescription)
            }
        }
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    private func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Network Error",
                                                message: (message + " Unable to save data. Please try again."),
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alertController, animated: true)
    }
}
