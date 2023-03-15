//
//  PageOneView.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 15.03.2023.
//

import UIKit

class PageOneView: UIView {
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()
    
    private lazy var menuCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .backgroundColor
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.backgroundColor = .backgroundColor
        self.addSubview(self.menuCollectionView)
        
        NSLayoutConstraint.activate([
        
            self.menuCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.menuCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.menuCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.menuCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
            
        ])
        
    }
    
    
    func configureCollectionView(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegateFlowLayout) {
        menuCollectionView.dataSource = dataSource
        menuCollectionView.delegate = delegate
        menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "menuCell")
    }
    
}
//self.view.backgroundColor = .backgroundColor
//self.view.addSubview(imageView)
//viewModel.getImage { image in
//    guard let image else {return}
//    DispatchQueue.main.async {
//        self.imageView.image = image
//    }
//}
//NSLayoutConstraint.activate([
//
//    self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//    self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//    self.imageView.widthAnchor.constraint(equalToConstant: 200),
//    self.imageView.heightAnchor.constraint(equalToConstant: 200),
//    
//
//
//])
