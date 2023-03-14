//
//  ProfileViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    var viewModel: ProfileViewModelProcol
    
    init(viewModel: ProfileViewModelProcol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let model = Model()
    
    private lazy var profileView: ProfileView = {
       let view = ProfileView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = profileView
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        profileView.configureTableView(dataSource: self, delegate: self)

    }

    private func setupNavigationBar() {
        self.navigationItem.title = "Profile"
    }
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.settingsImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
        
        cell.setup(modelImage: model.settingsImages[indexPath.row], modelString: model.settingsStrings[indexPath.row])
        
        if indexPath.row == 2 {
            cell.hideArrow(isArrowHidden: true, isSumHidden: false)
        } else if indexPath.row > 4 {
            cell.hideArrow(isArrowHidden: true, isSumHidden: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 6 {
            viewModel.returnToLogin()
        }
        
    }
}
extension ProfileViewController: ProfileViewDelegate {
    func uploadButtonDidTap() {
        viewModel.uploadFoto(delegate: self)
    }
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }

        self.profileView.avatarImage.image = image
        self.viewModel.dismiss()
    }
}
