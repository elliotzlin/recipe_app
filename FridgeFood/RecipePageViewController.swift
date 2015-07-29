//
//  RecipePageViewController.swift
//  Fridge Food
//
//  Created by Elliot on 7/7/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import UIKit

class RecipePageViewController: UIViewController {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var prepTimeLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    var recipe: Recipe!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = recipe.name
        
        var leftConstraint = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(leftConstraint)
        
        var rightConstraint = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(rightConstraint)
        
        var topConstraint = NSLayoutConstraint(item: scrollView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        self.view.addConstraint(topConstraint)
        
        var bottomConstraint = NSLayoutConstraint(item: scrollView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(bottomConstraint)
        
        var bottomContentConstraint = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: ingredientsTextView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(bottomContentConstraint)
        
        recipeImage.image = UIImage(named: recipe.imageFile)
        ingredientsTextView.scrollEnabled = false
        prepTimeLabel.text = recipe.prepTime
        var ingredientText: NSMutableString = ""
        for ingredient: Ingredient in recipe.ingredients {
            ingredientText.appendString(ingredient.toString() + "\n")
        }
        ingredientsTextView.text = ingredientText
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
