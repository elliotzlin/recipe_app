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
    
    init(name: String) {
        self.name = name
        super.init()
    }
}