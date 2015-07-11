//
//  IngredientDetailsViewController.swift
//  Fridge Food
//
//  Created by Elliot on 6/26/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import UIKit

class IngredientDetailsViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var qtyTextField: UITextField!
    
    var ingredient: Ingredient!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveIngredientDetail" {
            ingredient = Ingredient(name: self.nameTextField.text, qty: self.qtyTextField.text)
        }
    }

}
