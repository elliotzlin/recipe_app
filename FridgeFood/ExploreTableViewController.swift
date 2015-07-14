//
//  ExploreTableViewController.swift
//  Fridge Food
//
//  Created by Elliot on 7/13/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import UIKit

class ExploreTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol {

    var tableData = []
    let api = APIController()
    @IBOutlet var appsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.delegate = self
        api.searchForRecipe("Ground beef")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceiveAPIResults(results: NSArray) {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = results
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
        let cell = tableView.dequeueReusableCellWithIdentifier("resultCell", forIndexPath: indexPath) as UITableViewCell

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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
