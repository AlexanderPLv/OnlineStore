//
//  UserProfileController.swift
//  OnlineStore
//
//  Created by Alexander Pelevinov on 20.03.2021.
//

import UIKit

class UserProfileController: UITableViewController {
    private let requestFactory = RequestFactory()
    private var dataRecieved = false
    private let heightForRow: CGFloat = 50
    private let cellTitles = UserInfoPlaceholder()
    private var dataToShow = Array(repeating: " ", count: 6) {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.tableView.reloadData()
                refreshControl?.endRefreshing()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configRefreshControl()
        getData()
    }
    
    private func setup() {
        navigationItem.title = "User Info"
        tableView.register(UserProfileCell.self,
                           forCellReuseIdentifier: UserProfileCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func configRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self,
                                            action: #selector(handleRefreshControl),
                                            for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        getData()
    }
    
    private func getData() {
        let request = requestFactory.makeGetUserDataFactory()
        guard let token = Session.shared.token else { return }
        let userId = Session.shared.userId
        request.getUserData(userId: userId, token: token) { (response) in
            switch response {
            case .success(let response):
                guard let user = response.first else { return }
                self.dataToShow = self.tryToGetArrayOfUserData(with: user)
                self.dataRecieved = true
            case .failure(let error):
                self.showAlert(with: error.localizedDescription)
                self.refreshControl?.endRefreshing()
                self.dataRecieved = false
            }
        }
    }
    
    private func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Network Error",
                                                message: (message + " No data is currently available. Please pull down to refresh."),
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok",
                                                style: .cancel))
        present(alertController, animated: true)
    }
    
    private func tryToGetArrayOfUserData(with user: UserProfile) -> [String] {
        var stringArray = [String]()
        stringArray.append("\(user.userName)")
        stringArray.append("\(user.password)")
        stringArray.append("\(user.email)")
        stringArray.append("\(user.creditCard)")
        stringArray.append("\(user.gender ?? " ")")
        stringArray.append("\(user.bio ?? " ")")
        return stringArray
    }
}

extension UserProfileController {
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserProfileCell.reuseIdentifier,
                                                       for: indexPath) as? UserProfileCell
        else { fatalError() }
        let title = cellTitles.array[indexPath.row]
        let info = dataToShow[indexPath.row]
        
        cell.set(titleText: title, infoText: info)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        cellTitles.array.count
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        guard dataRecieved == true else { return }
        let editorController = ChangeUserDataController(dataToEdit: dataToShow,
                                                        index: indexPath.row)
        let navController = CustomNavigationController(rootViewController: editorController)
        editorController.delegate = self
        present(navController, animated: true, completion: nil)
    }
}

extension UserProfileController: UserProfileControllerDelegate {
    func didEditUserData(data: [String]) {
        dataToShow = data
    }
}
