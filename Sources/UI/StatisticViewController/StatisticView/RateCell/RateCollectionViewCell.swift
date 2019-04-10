//
//  RateCollectionViewCell.swift
//  TestUI2
//
//  Created by Dima Omelchenko on 4/10/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

class RateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var textView: UILabel?
    
    func fill(model: RateCellViewModel) {
        self.imageView?.image = model.image
        self.textView?.text = model.text
    }
}
