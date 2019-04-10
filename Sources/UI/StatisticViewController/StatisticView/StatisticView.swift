//
//  StatisticView.swift
//  TestUI2
//
//  Created by Dima Omelchenko on 4/10/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

class StatisticView: UIView {
    
    @IBOutlet var firstRateCell: RateCellView?
    @IBOutlet var secondRateCell: RateCellView?
    @IBOutlet var thirdRateCell: RateCellView?
    @IBOutlet var fourthRateCell: RateCellView?
    @IBOutlet var diagrammImage: UIImageView?
    
    func fillRateCell() {
        self.firstRateCell?.fill(image: UIImage(asset: Asset.health), text: "Death: $250,000")
        self.secondRateCell?.fill(image: UIImage(asset: Asset.clinic), text: "Clinic service")
        self.thirdRateCell?.fill(image: UIImage(asset: Asset.health), text: "Low price")
        self.fourthRateCell?.fill(image: UIImage(asset: Asset.bed), text: "Comfort rest")
        self.diagrammImage?.image = UIImage(asset: Asset.logo)
    }
}
