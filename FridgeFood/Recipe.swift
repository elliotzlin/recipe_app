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
    var ingredients: [Ingredient]!
    var imageFile: String! = "no-photo-available.jpg"
    var prepTime: String!
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    init(name: String, ingredients: [Ingredient]) {
        self.name = name
        super.init()
        setIngredients(ingredients)
    }
    
    init(name: String, ingredients: [Ingredient], imageFile: String) {
        self.name = name
        super.init()
        setIngredients(ingredients)
        setImage(imageFile)
    }
    
    init(name: String, ingredients: [Ingredient], prepTime: String) {
        self.name = name
        super.init()
        setIngredients(ingredients)
        setPrepTime(prepTime)
    }
    
    init(name: String, ingredients: [Ingredient], imageFile: String, prepTime: String) {
        self.name = name
        super.init()
        setIngredients(ingredients)
        setImage(imageFile)
        setPrepTime(prepTime)
    }
    
    func setIngredients(ingredients: [Ingredient]) {
        self.ingredients = ingredients
    }
    
    func setImage(imageFile: String) {
        self.imageFile = imageFile
    }
    
    func setPrepTime(prepTime: String) {
        self.prepTime = prepTime
    }
    
}
