//
//  RecipeDetailsController.swift
//  Fridge Food
//
//  Created by Elliot on 6/18/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var prepTimeField: UITextField!
    
    var isEditing: Bool = false
    
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
        nameTextField.delegate = self; prepTimeField.delegate = self
        /*
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(tap)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveRecipeDetail" {
            recipe = Recipe(name: self.nameTextField.text, ingredients: ingredientData, prepTime: prepTimeField.text)
        }
        if segue.identifier == "AddIngredients" {
            if let ingredientsViewController = segue.destinationViewController as? IngredientsViewController {
                ingredientsViewController.ingredients = ingredientData
            }
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField){
        isEditing = true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        isEditing = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    /*
    func dismissKeyboard(textField: UITextField) {
        if (isEditing) {
            self.view.endEditing(true)
        }
    }*/
        
}
