//
//  CreatePasswordViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 12.03.2023.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    
    private lazy var createLabel = InfoLabels(inform: "Create password", size: 25, weight: .bold, color: .black)
    
    private lazy var passwordTextField = regTextField(placeholderText: "Password", typeKeyBoard: .default)
    
    private lazy var regButton = CustomButton(buttonText: "Create", textColor: .white, background: .buttonColor, fontSize: 13, fontWeight: .bold)

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    private func setupView() {
        self.view.backgroundColor = .backgroundColor
    }

   
}
