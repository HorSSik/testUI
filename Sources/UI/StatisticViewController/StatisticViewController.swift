//
//  StatisticViewController.swift
//  TestUI2
//
//  Created by Dima Omelchenko on 4/10/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

protocol DataProviderType {
    
    typealias DataType = [RateCellViewModel]
    
    func data() -> DataType
}

class MockProviderType: DataProviderType {
    
    func data() -> DataType {
        return [
            ("Death: $250,000", Asset.health),
            ("Clinic service", Asset.clinic),
            ("Low price", Asset.health),
            ("Comfort rest", Asset.bed)
        ]
            .compactMap {
                let image = UIImage(asset: $0.1)
                
                return RateCellViewModel(image: image, text: $0.0)
            }
    }
}

class StatisticViewController: UIViewController, RootViewRepresentable, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    typealias RootView = StatisticView
    typealias CellType = RateCollectionViewCell
    
    // MARK: -
    // MARK: Accessors
    
    let provider: DataProviderType
    
    var models = DataProviderType.DataType()
    
    // MARK: -
    // MARK: Initializations
    
    init(provider: DataProviderType) {
        self.provider = provider
        
        super.init(nibName: nil, bundle: nil)
        
        self.models = self.provider.data()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: ViewLifeCylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.prepareView()
        
        self.rootView?.collectionView?.register(CellType.self)
    }
    
    // MARK: -
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withCellClass: CellType.self, indexPath: indexPath) { cell in
            cell.fill(model: self.models[indexPath.row])
        }
    }

    // MARK: -
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    )
        -> CGSize
    {
        let frame = self.rootView?.collectionView?.frame ?? .zero
        
        return frame.size.halfPart()
    }
}

extension CGSize {
    
    func halfPart() -> CGSize {
        return CGSize(width: self.width * 0.5, height: self.height * 0.5)
    }
    
    func fourthPart() -> CGSize {
        return CGSize(width: self.width * 0.25, height: self.height * 0.25)
    }
}
