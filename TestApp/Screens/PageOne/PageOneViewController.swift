//
//  ViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class PageOneViewController: UIViewController {
    var isFirst = true
    static let headerElementKind = "header-element-kind"
    var viewModel: PageOneViewModelProcol
    
    init(viewModel: PageOneViewModelProcol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var pageOneView: PageOneView = {
        let view = PageOneView()
        view.searchBar.delegate = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = pageOneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        setupNavigationBar()
        pageOneView.activityIndicator.isHidden = false
        pageOneView.activityIndicator.startAnimating()
        self.viewModel.getData(networkPath: .latest) { [weak self] result in
            let latest = result as! [LatestItem]
            self?.pageOneView.latest = latest
            self?.viewModel.getData(networkPath: .flashSale) { result in
                let flash = result as! [FlashSaleItem]
                self?.pageOneView.flashSale = flash
                DispatchQueue.main.async {
                    self?.pageOneView.activityIndicator.isHidden = true
                    self?.pageOneView.activityIndicator.stopAnimating()
                    self?.pageOneView.configureHierarchy()
                    self?.pageOneView.configureDataSource()
                }
            }
            
        }
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .black
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .done, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftButton
        
    }
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
}
extension PageOneViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if isFirst {
            if searchBar.searchTextField.isEditing {
                viewModel.getAutocomplete {
                    pageOneView.searchBar.tableView?.reloadData()
                }
                isFirst = false
            }
        }
        if searchText == "" {
            pageOneView.searchBar.tableView?.isHidden = true
        }
        
    }
}
