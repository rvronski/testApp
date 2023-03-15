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
    
    private lazy var imageView = CustomImageView(imageName: "")
  
    private lazy var pageOneView: PageOneView = {
        let view = PageOneView()
        return view
    }()
    
    
    override func loadView() {
        self.view = pageOneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageOneView.configureCollectionView(dataSource: self, delegate: self)
    }


}

extension PageOneViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = (collectionView.frame.width - 136) / 6
        let height = 100
        return CGSize(width: itemWidth, height: 100)
        
    }
    
}
