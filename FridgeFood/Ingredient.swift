//
//  Ingredient.swift
//  Fridge Food
//
//  Created by Elliot on 6/18/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import Foundation
import UIKit

class Ingredient: NSObject {
    var name: String
    var qty: String!
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    init(name: String, qty: String) {
        self.name = name
        super.init()
        setQuantity(qty)
    }
    
    func setQuantity(qty: String) {
        self.qty = qty
    }
    
    func toString() -> String {
        if qty != nil {
          return qty + " " + name
        } else {
            return name
        }
        
    }
    
}