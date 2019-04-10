//
//  StatisticViewController.swift
//  TestUI2
//
//  Created by Dima Omelchenko on 4/10/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = StatisticView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.fillRateCell()
    }
}
