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
    
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveRecipeDetail" {
            recipe = Recipe(name: self.nameTextField.text)
        }
    }
    
}
