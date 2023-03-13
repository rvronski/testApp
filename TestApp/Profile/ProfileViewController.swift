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
    
    private lazy var profileView: ProfileView = {
       let view = ProfileView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = profileView
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

    }

    private func setupNavigationBar() {
        self.navigationItem.title = "Profile"
    }


}
