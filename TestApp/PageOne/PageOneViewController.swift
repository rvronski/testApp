//
//  ViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class PageOneViewController: UIViewController {
    
    static let headerElementKind = "header-element-kind"
    var latest = [LatestItem]()
    var flashSale = [FlashSaleItem]()
    private let model = PageOneModel()
    var viewModel: PageOneViewModelProcol
    
    init(viewModel: PageOneViewModelProcol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    enum Section: Int, CaseIterable {
        case menu
        case latest
        case flashSale
        
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "App Store"
        setupView()
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.viewModel.getData(networkPath: .latest) { [weak self] result in
            let latest = result as! [LatestItem]
            self?.latest = latest
            self?.viewModel.getData(networkPath: .flashSale) { result in
                let flash = result as! [FlashSaleItem]
                self?.flashSale = flash
                DispatchQueue.main.async {
                    self?.activityIndicator.isHidden = true
                    self?.activityIndicator.stopAnimating()
                    self?.configureHierarchy()
                    self?.configureDataSource()
                }
            }
            
        }
    }
    
    private func setupView() {
        self.view.backgroundColor = .backgroundColor
        self.view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
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
    
    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .backgroundColor
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.cellIdentifire)
        collectionView.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.cellIdentifire)
        collectionView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashSaleCollectionViewCell.cellIdentifire)
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell in
            let section = Section(rawValue: indexPath.section)
            switch section {
            case .menu:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.cellIdentifire, for: indexPath) as! MenuCollectionViewCell
                let model = PageOneModel()
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
            case .none:
                fatalError("no cell")
                
            }
        })
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration
        <TitleSupplementaryView>(elementKind: PageOneViewController.headerElementKind) {
            (supplementaryView, string, indexPath) in
            if indexPath.section == 1 {
                supplementaryView.label.text = "Latest"
            } else if indexPath.section == 2 {
                supplementaryView.label.text = "Flash Sale"
            } else {
                supplementaryView.allButtom.isHidden = true
            }
        }
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return self.collectionView.dequeueConfiguredReusableSupplementary(
                using: supplementaryRegistration, for: index)
        }
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        let flashId = flashSale.map({$0.id.hashValue})
        let latId = latest.map({$0.id.hashValue})
        snapshot.appendSections([.menu])
        snapshot.appendItems([13,45,67,15,14,19], toSection: .menu)
        snapshot.appendSections([.latest])
        snapshot.appendItems(latId, toSection: .latest)
        snapshot.appendSections([.flashSale])
        snapshot.appendItems(flashId, toSection: .flashSale)
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
    
}
