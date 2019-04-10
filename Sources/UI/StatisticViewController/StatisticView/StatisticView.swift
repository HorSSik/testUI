//
//  StatisticView.swift
//  TestUI2
//
//  Created by Dima Omelchenko on 4/10/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

class StatisticView: UIView {
    
    @IBOutlet var diagrammImage: UIImageView?
    @IBOutlet var collectionView: UICollectionView?
    
    func prepareView() {
        self.diagrammImage?.image = UIImage(asset: Asset.logo)
    }
}
