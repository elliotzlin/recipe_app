//
//  RecipeDetailsController.swift
//  Fridge Food
//
//  Created by Elliot on 6/18/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBAction func addIngredients(segue:UIStoryboardSegue) {
        if let ingredientsViewController = segue.sourceViewController as? IngredientsViewController {
            let ingredients = ingredientsViewController.ingredients
            detailLabel.text = String(ingredients.count) + " items"
            ingredientData = ingredients
        }
    }

    
    let superViewController: RecipesViewController = RecipesViewController()
    
    var recipe: Recipe!
    var ingredientData: [Ingredient] = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = "0 items"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveRecipeDetail" {
            recipe = Recipe(name: self.nameTextField.text, ingredients: ingredientData)
        }
        if segue.identifier == "AddIngredients" {
            if let ingredientsViewController = segue.destinationViewController as? IngredientsViewController {
                ingredientsViewController.ingredients = ingredientData
            }
        }
    }
    
}
