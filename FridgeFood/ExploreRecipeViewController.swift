//
//  ExploreRecipeViewController.swift
//  FridgeFood
//
//  Created by Elliot on 7/20/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import UIKit

class ExploreRecipeViewController: UIViewController, APIControllerProtocol {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    let api = APIController()
    var didFinishLoading: Bool = false
    
    var headerTitle: String?
    var id: String?
    var recipeResults: NSDictionary!
    
    //Recipe data from JSON
    var imgURL: String! = "no-photo-available.jpg"

    //Recipe data to be shown in View Controller
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var ingrTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = headerTitle
        
        api.delegate = self
        api.getRecipe(id!)
        
        ingrTextView.scrollEnabled = false
        
        //scroll view constraints
        var topConstraint = NSLayoutConstraint(item: scrollView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        self.view.addConstraint(topConstraint)
        
        var bottomConstraint = NSLayoutConstraint(item: scrollView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(bottomConstraint)
        
        //content view constraints
        var leftConstraint = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(leftConstraint)
        
        var rightConstraint = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(rightConstraint)
        
        var bottomContentConstraint = NSLayoutConstraint(item: contentView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: ingrTextView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(bottomContentConstraint)
        
        
        while(didFinishLoading == false) {
            
        }
        
        
        //Set the UIImage
        imgURL = recipeResults["image_url"] as? String
        let imageURL = NSURL(string: imgURL!)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
            let imageData: NSData = NSData(contentsOfURL: imageURL!)!
            
            dispatch_async(dispatch_get_main_queue(), {
                self.recipeImage.contentMode = .ScaleAspectFill
                self.recipeImage.image = UIImage(data: imageData)
                
                //Set up info here so it appears at the same time as image
                let imageHeight = self.recipeImage.imageScale().height * self.recipeImage.image!.size.height
                
                println(imageHeight)
                var ingrLabelConstraint = NSLayoutConstraint(item: self.ingredientsLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: imageHeight - (imageHeight/2.0 - self.recipeImage.frame.size.height/2.0) + 6.0)
                self.view.addConstraint(ingrLabelConstraint)
                
                var ingrTextConstraint = NSLayoutConstraint(item: self.ingrTextView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: imageHeight - (imageHeight/2.0 - self.recipeImage.frame.size.height/2.0) + 35.0)
                self.view.addConstraint(ingrTextConstraint)

                self.ingredientsLabel.text = "Ingredients"
            })
            
        })
        
        if let ingredients: NSArray = recipeResults["ingredients"] as? NSArray {
            var ingredientText: NSMutableString = ""
            for var i = 0; i < ingredients.count; ++i {
                if let words = ingredients[i] as? String {
                    ingredientText.appendString(words + "\n")
                }
                
            }
            self.ingrTextView.text = ingredientText
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveAPIResults(results: NSDictionary) {
        //dispatch_async(dispatch_get_main_queue(), {
            
            if let recipe = results["recipe"] as? NSDictionary {
                self.recipeResults = recipe
                self.didFinishLoading = true
            }
        //})
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
