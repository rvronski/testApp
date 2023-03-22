//
//  PageOneView.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 15.03.2023.
//

import UIKit

class PageOneView: UIView {
    private let model = PageOneModel()
    var latest = [LatestItem]()
    var flashSale = [FlashSaleItem]()
    let searchBar = CustomSearchBar()
    lazy var avatarView = CustomImageView(imageName: "avatarImage")
    private lazy var navigationLabel = InfoLabels(inform: "Trade by", size: 20, weight: .bold, color: .black)
    private lazy var navigationLabel2 = InfoLabels(inform: "bata", size: 20, weight: .bold, color: .buttonColor)
    private lazy var locationabel = InfoLabels(inform: "Location", size: 10, weight: .medium, color: .gray)
    private lazy var arrowImage = CustomSystemImageView(systemName: "chevron.down", color: .black)
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    enum Section: Int, CaseIterable {
        case menu
        case latest
        case flashSale
        case brands
        
    }
   
    var shopCollectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private func setupView() {
        
        self.backgroundColor = .backgroundColor
        self.addSubview(activityIndicator)
        self.addSubview(searchBar)
        self.addSubview(avatarView)
        self.addSubview(navigationLabel)
        self.addSubview(navigationLabel2)
        self.addSubview(locationabel)
        self.addSubview(arrowImage)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            avatarView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            avatarView.rightAnchor.constraint(equalTo: self.rightAnchor, constant:  -50),
            avatarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            avatarView.heightAnchor.constraint(equalTo: avatarView.widthAnchor),
            
            self.navigationLabel2.centerYAnchor.constraint(equalTo: self.avatarView.centerYAnchor),
            self.navigationLabel2.rightAnchor.constraint(equalTo: self.avatarView.leftAnchor, constant: -55),
            self.navigationLabel.centerYAnchor.constraint(equalTo: self.avatarView.centerYAnchor),
            self.navigationLabel.rightAnchor.constraint(equalTo: self.navigationLabel2.leftAnchor, constant: -6),
            
            self.locationabel.topAnchor.constraint(equalTo: self.avatarView.bottomAnchor, constant: 10),
            self.locationabel.centerXAnchor.constraint(equalTo: self.avatarView.centerXAnchor, constant: -5),
            
            self.arrowImage.leftAnchor.constraint(equalTo: self.locationabel.rightAnchor, constant: 4),
            self.arrowImage.centerYAnchor.constraint(equalTo: self.locationabel.centerYAnchor),
            self.arrowImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.02),
            self.arrowImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.01),
            
            searchBar.topAnchor.constraint(equalTo: locationabel.bottomAnchor, constant: 10),
            searchBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            searchBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            let section = self.layoutSection(for: sectionKind, layoutEnvironment: layoutEnvironment)
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .estimated(44)),
                elementKind: PageOneViewController.headerElementKind,
                alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]
            return section
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16.0
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
        return layout
    }
    
    func configureHierarchy() {
        
        shopCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        shopCollectionView.translatesAutoresizingMaskIntoConstraints = false
        shopCollectionView.backgroundColor = .backgroundColor
        shopCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        shopCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.cellIdentifire)
        shopCollectionView.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.cellIdentifire)
        shopCollectionView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashSaleCollectionViewCell.cellIdentifire)
        shopCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier: BrandCollectionViewCell.cellIdentifier)
        self.addSubview(shopCollectionView)
        
        NSLayoutConstraint.activate([
            shopCollectionView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 5),
            shopCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            shopCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shopCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: shopCollectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell in
            let section = Section(rawValue: indexPath.section)
            let model = PageOneModel()
            switch section {
            case .menu:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.cellIdentifire, for: indexPath) as! MenuCollectionViewCell
              
                cell.setup(modelImage: model.menuImage[indexPath.row], modelDescription: model.menuDescription[indexPath.row])
                return cell
            case .latest:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.cellIdentifire, for: indexPath) as! LatestCollectionViewCell
                cell.configure(model: self.latest[indexPath.row])
                return cell
            case .flashSale:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashSaleCollectionViewCell.cellIdentifire, for: indexPath) as! FlashSaleCollectionViewCell
                cell.configure(model: self.flashSale[indexPath.row])
                return cell
            case .brands:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.cellIdentifier, for: indexPath) as! BrandCollectionViewCell
                cell.configure(model: model.brandsImage[indexPath.row])
                return cell
                
            case .none:
                fatalError("no cell")
                
            }
        })
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration
        <TitleSupplementaryView>(elementKind: PageOneViewController.headerElementKind) {
            (supplementaryView, string, indexPath) in
            let section = Section(rawValue: indexPath.section)
            let model = PageOneModel()
            switch section {
            case .menu:
                supplementaryView.label.text = ""
                supplementaryView.allButtom.isHidden = true
            case .latest:
                supplementaryView.label.text = "Latest"
            case .flashSale:
                supplementaryView.label.text = "Flash Sale"
            case .brands:
                supplementaryView.label.text = "Brands"
                supplementaryView.allButtom.isHidden = false
            case .none:
                fatalError()
           
            }
            
      

        }
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return self.shopCollectionView.dequeueConfiguredReusableSupplementary(
                using: supplementaryRegistration, for: index)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        let flashId = flashSale.map({$0.id.hashValue})
        let latId = latest.map({$0.id.hashValue})
        let model = PageOneModel()
        let brandsId = model.brandsImage.map({$0.hashValue})
        snapshot.appendSections([.menu])
        snapshot.appendItems((Array(0..<12)), toSection: .menu)
        snapshot.appendSections([.latest])
        snapshot.appendItems(latId, toSection: .latest)
        snapshot.appendSections([.flashSale])
        snapshot.appendItems(flashId, toSection: .flashSale)
        snapshot.appendSections([.brands])
        snapshot.appendItems(brandsId, toSection: .brands)
        
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func layoutSection(for section: Section, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch section {
        case .menu:
            return menuSection()
        case .latest:
            return latestSection()
        case .flashSale:
            return flashSaleSection()
        case .brands:
           return brandsSection()
        }
    }
    
    private func menuSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/6.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        //        group.contentInsets = .init(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func latestSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3.0), heightDimension: .fractionalHeight(1.0)) // height is ignored
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.450))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item]) // <<<===
        //        group.interItemSpacing = .fixed(2.0)
        
        
        let section = NSCollectionLayoutSection(group: group)
        //        section.interGroupSpacing = 8
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func flashSaleSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/2.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item]) // <<<===
        //        group.interItemSpacing = .fixed(2.0)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func brandsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
