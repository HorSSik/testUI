//
//  RateCell.swift
//  TestUI2
//
//  Created by Dima Omelchenko on 4/10/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

class RateCellView: ReusableView {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var textView: UILabel?
    
    func fill(image: UIImage?, text: String) {
        self.imageView?.image = image
        self.textView?.text = text
    }
}
