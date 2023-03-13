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
    
  
    
//    override func loadView() {
//        <#code#>
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

