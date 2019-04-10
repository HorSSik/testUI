//
//  UINid+Extensions.swift
//  WeatherAPI
//
//  Created by Student on 14.01.2019.
//  Copyright © 2019 IDAP. All rights reserved.
//

import UIKit

extension UINib {
    
    convenience init(_ viewClass: AnyClass, bundle: Bundle? = nil) {
        self.init(nibName: toString(viewClass), bundle: bundle)
    }
    
    static func nib(withClass cls: AnyClass) -> UINib {
        return self.nib(withClass: cls, bundle: nil)
    }
    
    static func nib(withClass cls: AnyClass, bundle: Bundle?) -> UINib {
        return UINib(nibName: String(describing: cls), bundle: bundle)
    }
    
    static func object<Result>(withType type: AnyClass) -> Result? {
        let nib = UINib.nib(withClass: type)
        
        return nib.object(withClass: type, owner: nil, options: nil)
    }
    
    static func object<Result>(withType type: Result.Type) -> Result? {
        return self.object(withType: type, owner: nil)
    }
    
    static func object<Result>(withType type: Result.Type, owner: Any?) -> Result? {
        return self.object(withType: type, owner: owner, options: nil)
    }
    
    static func object<Result>(withType type: Result.Type, owner: Any?, options: [UINib.OptionsKey : Any]?) -> Result? {
        let nib = UINib.nib(withClass: type as! AnyClass)
        
        return nib.object(withType: type, owner: owner, options: options)
    }
    
    func object<Result>(withType type: Result.Type) -> Result? {
        return self.object(withType: type, owner: nil)
    }
    
    func object<Result>(withType type: Result.Type, owner: Any?) -> Result? {
        return self.object(withType: type, owner: owner, options: nil)
    }
    
    func object<Result>(withType type: Result.Type, owner: Any?, options: [UINib.OptionsKey : Any]?) -> Result? {
        let objects = self.instantiate(withOwner: owner, options: options)
        
        let result = objects.first
        
        return cast(result)
    }
    
    func object<Result>(withСlass cls: AnyClass) -> Result? {
        return self.object(withClass: cls, owner: nil)
    }
    
    func object<Result>(withClass cls: AnyClass, owner: Any?) -> Result? {
        return self.object(withClass: cls, owner: owner, options: nil)
    }
    
    func object<Result>(withClass cls: AnyClass, owner: Any?, options: [UINib.OptionsKey : Any]?) -> Result? {
        let objects = self.instantiate(withOwner: owner, options: options)
        
        let result = objects.first { value in
            
            return "\(type(of: value))" == "\(cls)"
        }
        
        return cast(result)
    }
}
