//
//  ReusableView.swift
//  Underscore Radio
//
//  Created by IDAP Developer on 3/12/18.
//  Copyright © 2018 IDAP. All rights reserved.
//

import UIKit

/*
 
 Make this class as parent of view class and you
 will reuse xib at all xib where you specify
 
 */

@IBDesignable class ReusableView: UIView {
    
    //MARK: -
    //MARK: Variables
    
    private static var inInitializaiton = [String : Bool]()
    
    //MARK: -
    //MARK: Private
    
    private func prepareConstraints(on view: UIView) {
        self.constraints.forEach { constraint in
            let firstItem = constraint.firstItem === self ? view : constraint.firstItem
            let secondItem = constraint.secondItem === self ? view : constraint.secondItem
            
            view
                .addConstraint(
                    NSLayoutConstraint(
                        item: firstItem as Any,
                        attribute: constraint.firstAttribute,
                        relatedBy: constraint.relation,
                        toItem: secondItem,
                        attribute: constraint.secondAttribute,
                        multiplier: constraint.multiplier,
                        constant: constraint.constant
                    )
            )
        }
    }
    
    private func prepareLayout(on view: UIView) {
        view.frame = self.frame
        view.autoresizingMask = self.autoresizingMask
        view.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints
    }
    
    private func prepareSubviews(on view: UIView) {
        let constraints = self.constraints
        
        self.subviews.forEach {
            view.insertSubview($0, at: 0)
        }
        
        constraints.forEach { constraint in
            
            if !(self.constraints.contains { $0 === constraint }) && !constraint.isActive {
                self.addConstraint(constraint)
            }
        }
        
        self.addConstraints(constraints)
    }
    
    private func viewFromNib(cls: AnyClass) -> UIView? {
        let view: UIView? = UINib.nib(withClass: cls).object(withСlass: cls)

        view.do {
            self.prepareLayout(on: $0)
            self.prepareSubviews(on: $0)
            self.prepareConstraints(on: $0)
        }
        
        view?.constraints.forEach {
            if !$0.isActive {
                view?.removeConstraint($0)
            }
        }
        
        return view
    }
    
    //MARK: -
    //MARK: View Life Cycle
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        var object: UIView? = cast(super.replacementObject(for: aDecoder))
        let cls = "\(type(of: self))"
        
        let inInitializaiton = ReusableView.inInitializaiton[cls] ?? false
        
        if !inInitializaiton {
            ReusableView.inInitializaiton[cls] = true
            object = self.viewFromNib(cls: type(of: self))
            ReusableView.inInitializaiton[cls] = false
        }
        
        return object
    }
}
