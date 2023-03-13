//
//  ViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class PageOneViewController: UIViewController {
    
    var viewModel: PageOneViewModelProcol
    
    init(viewModel: PageOneViewModelProcol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private lazy var outButton = CustomButton(buttonText: "Out", textColor: .black, background: .clear, fontSize: 20, fontWeight: .bold)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(outButton)
        
        NSLayoutConstraint.activate([
            self.outButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.outButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
    
        ])
        outButton.tapButton = {[weak self] in
            
            self?.viewModel.returnToLogin()
            
        }
    }


}

