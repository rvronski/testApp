//
//  ViewController.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 10.03.2023.
//

import UIKit

class PageOneViewController: UIViewController {
    

    var latest = [LatestItem]()
    var flashSale = [FlashSaleItem]()
    private let model = PageOneModel()
    var viewModel: PageOneViewModelProcol
    var latId = [Int]()
    init(viewModel: PageOneViewModelProcol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Section: Int, CaseIterable {
        case menu
        case latest
        case flashSale
    //        case brands
    }
   
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "App Store"
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global().async {
            self.viewModel.getData(networkPath: .latest) { result in
                let latest = result as! [LatestItem]
                DispatchQueue.main.async {
                    self.latest = latest
                    self.latId = latest.map({$0.id.hashValue})
                }
                    
            }
            self.viewModel.getData(networkPath: .flashSale) { result in
                let flash = result as! [FlashSaleItem]
                self.flashSale = flash
            }
            group.leave()
        }
        group.notify(queue: .main) {
            self.configureHierarchy()
            self.configureDataSource()
            print(self.latest)
            print(self.flashSale)
            
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            let section = self.layoutSection(for: sectionKind, layoutEnvironment: layoutEnvironment)
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
    
//    private lazy var menuRange: ClosedRange<Int> = 1...model.menuImage.count
//    private lazy var latestRange: ClosedRange<Int> = (menuRange.upperBound + 1)...(menuRange.upperBound + latest.image.count)
//    private lazy var categoryRange: ClosedRange<Int> = (appsRange.upperBound + 1)...(appsRange.upperBound + categories.count)
//    private lazy var featureRange: ClosedRange<Int> = (categoryRange.upperBound + 1)...(categoryRange.upperBound + features.count)
//
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
//
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
       
        let flashId = flashSale.map({$0.id.hashValue})
       
        snapshot.appendSections([.menu])
        snapshot.appendItems([13,45,67,15,14,19], toSection: .menu)
        snapshot.appendSections([.latest])
        snapshot.appendItems([243,4547,65748,73738,635], toSection: .latest)
        snapshot.appendSections([.flashSale])
        snapshot.appendItems([4670,640,875,9020,571086], toSection: .flashSale)
        
//        Section.allCases.forEach { section in
//            snapshot.appendSections([section])
//            snapshot.appendItems([1,2,3,4,5,6,7,8,9,10,11,12], toSection: section)
//        }


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
        group.contentInsets = .init(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func latestSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3.0), heightDimension: .fractionalHeight(1.0)) // height is ignored
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(170))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item]) // <<<===
//        group.interItemSpacing = .fixed(2.0)
        
       
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func flashSaleSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/2.0), heightDimension: .fractionalHeight(1.0)) // height is ignored
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(230))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item]) // <<<===
//        group.interItemSpacing = .fixed(2.0)
        
       
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
//    private func featureSection(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
//        let feature = FeatureLayoutSection(containerWidth: layoutEnvironment.container.contentSize.width)
//        feature.delegate = self
//        if let section = feature.collectionLayoutSection() {
//            return section
//        } else {
//            fatalError("Cannot create Feature section")
//        }
//    }
}

//extension PageOneViewController: FeatureLayoutSectionDelegate {
//    func sizes(for featureLayout: FeatureLayoutSection) -> [CGSize] {
//        features.map { $0.size }
//    }
//
//    func itemSpacing(for featureLayout: FeatureLayoutSection) -> CGFloat {
//        16.0
//    }
//
//    func rowSpacing(for featureLayout: FeatureLayoutSection) -> CGFloat {
//        16.0
//    }
//
//    func minimalSectionInset(for featureLayout: FeatureLayoutSection) -> CGFloat {
//        16.0
//    }
//}
