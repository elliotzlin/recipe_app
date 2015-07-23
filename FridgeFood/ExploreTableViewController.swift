//
//  ExploreTableViewController.swift
//  Fridge Food
//
//  Created by Elliot on 7/13/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import UIKit

class ExploreTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, APIControllerProtocol {

    var tableData = []
    var searchActive: Bool = false
    let api = APIController()
    @IBOutlet var appsTableView: UITableView!
    @IBOutlet weak var exploreSearchBar: UISearchBar!
    
    let kCellIdentifier = "resultCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.delegate = self
        exploreSearchBar.delegate = self
        api.searchForRecipe("")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveAPIResults(results: NSDictionary) {
        dispatch_async(dispatch_get_main_queue(), {
            if let results: NSArray = results["recipes"] as? NSArray {
                self.tableData = results
            }
            self.appsTableView!.reloadData()
        })
    }

    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return tableData.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier, forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        if let rowData: NSDictionary = self.tableData[indexPath.row] as? NSDictionary {
            //Grab image URL
            if let urlString = rowData["image_url"] as? String {
                let imgURL = NSURL(string: urlString)
                //Grab recipe name
                if let recipeName = rowData["title"] as? String {
                    cell.textLabel.text = recipeName

                }
            }
        }
       

        return cell
    }
    
    /*
    //Mark: - Search Bar Methods
    */
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        exploreSearchBar.setShowsCancelButton(true, animated: true)
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        api.searchForRecipe(exploreSearchBar.text)
        appsTableView.reloadData()
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        exploreSearchBar.setShowsCancelButton(false, animated: true)
        self.view.endEditing(true)
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        exploreSearchBar.setShowsCancelButton(false, animated: true)
        self.view.endEditing(true)
        searchActive = false
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "ViewRecipe" {
            if let recipePageViewController = segue.destinationViewController as? ExploreRecipeViewController {
                let indexPath: NSIndexPath! = appsTableView.indexPathForSelectedRow()
                if let recipeName = tableData[indexPath.row]["title"] as? String {
                    recipePageViewController.headerTitle = recipeName
                }
                if let recipeID = tableData[indexPath.row]["recipe_id"] as? String {
                    recipePageViewController.id = recipeID
                }
            }
        }
    }
    
    
    func hideKeyboard(sender: AnyObject) {
        exploreSearchBar.resignFirstResponder()
    }

}
