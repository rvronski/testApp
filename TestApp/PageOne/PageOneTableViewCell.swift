//
//  PageOneTableViewCell.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 16.03.2023.
//

import UIKit

//class PageOneTableViewCell: UITableViewCell {
//    
//    private lazy var layout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 16
//        layout.minimumInteritemSpacing = 16
//        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
//        return layout
//    }()
//
//    private lazy var collectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .backgroundColor
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: "ShopCell")
//        return collectionView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configureCollectionView(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegateFlowLayout) {
//        collectionView.dataSource = dataSource
//        collectionView.delegate = delegate
//        collectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: "menuCell")
//    }
//   
//    
//    private func setupView() {
//        self.contentView.addSubview(collectionView)
//        
//        NSLayoutConstraint.activate([
//        
//            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//            self.collectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
//            self.collectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
//            self.collectionView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5)
//        ])
//    }
//}
//extension PageOneTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShopCollectionViewCell
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let itemWidth = (collectionView.frame.width - 32) / 2.5
//
//        return CGSize(width: itemWidth, height: 200)
//
//    }
//}
