//
//  Recipe.swift
//  Fridge Food
//
//  Created by Elliot on 6/18/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    
    var name: String
    //var ingredients: [Ingredient]
    
    init(name: String) {
        self.name = name
        //self.ingredients = ingredients
        super.init()
    }
}
