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
    
    var headerTitle: String?
    var id: String?
    var recipeResults: NSDictionary?
    
    //Recipe data from JSON
    var imgURL: String?
    var ingredients = []
    
    //Recipe data to be shown in View Controller
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = headerTitle
        
        api.delegate = self
        api.getRecipe(id!)
        
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveAPIResults(results: NSDictionary) {
        dispatch_async(dispatch_get_main_queue(), {
            
            if let recipe = results["recipe"] as? NSDictionary {
                
                //Set the UIImage
                self.imgURL = recipe["image_url"] as? String
                let imageURL = NSURL(string: self.imgURL!)
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                    let imageData: NSData = NSData(contentsOfURL: imageURL!)!
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.recipeImage.contentMode = .ScaleAspectFill
                        self.recipeImage.image = UIImage(data: imageData)
                    })
                })

            }
        })
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
