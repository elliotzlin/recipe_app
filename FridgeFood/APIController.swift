//
//  APIController.swift
//  Fridge Food
//
//  Created by Elliot on 7/13/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSArray)
}

class APIController {
    
    var delegate: APIControllerProtocol?
    
    let APIKey = "a87cab2da1c9b13b91e257c638af2c63"
    
    func searchForRecipe(searchTerm: String) {
        
        //Make search term URL-friendly
        let food2forkSearchTerm = searchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        let urlPath = "http://food2fork.com/api/search?key=\(APIKey)&q=" + food2forkSearchTerm!
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in println("Task completed")
            if(error != nil) {
                //If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary {
                if(err != nil) {
                    //If there is an error parsing JSON, print it to the console
                    println("JSON Error \(err!.localizedDescription)")
                }
                if let results: NSArray = jsonResult["recipes"] as? NSArray {
                    self.delegate?.didReceiveAPIResults(results)
                }
            }
        
        })
        
        //The task is just an object with all these properties set
        //In order to actually make the web request, we need to "resume"
        task.resume()
    }
    
    init() {}
    
}