//
//  CurrentCategory.swift
//  Shandy
//
//  Created by Vitaliy on 03/09/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation
import Alamofire

class CurrentCategory {
    private var _name: String!
    private var _recipesCount: Int!
    
    var name: String {
        if _name == nil {
            _name = "Undefined category"
        }
        return _name
    }
    
    var recipesCount:Int {
        if _recipesCount == nil {
            _recipesCount = 0
        }
        return _recipesCount
    }
    
    func getCategoryDetails(completed: DownloadComplete) {
        let categoryPath = "\(BASE_URL)categories/beer.json"
        let categoryUrl = URL(string: categoryPath)!
        
        
        Alamofire.request(categoryUrl, withMethod: .get).responseJSON { response in
            debugPrint(response)     // prints detailed description of all response properties
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization

            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                print("JSON: \(JSON)")
                
                if let name = JSON["name"] as? String {
                    self._name = name
                }
                
                if let count = JSON["recipes_count"] as? Int {
                    self._recipesCount = count
                }
                
                print("Name is \(self._name!) and recipes count is \(self._recipesCount!)")
            }
        }
        completed()
    }
}
