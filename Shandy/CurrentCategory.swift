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
    var _name: String!
    var _recipesCount: Int!
    
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
        let categoryPath = "\(BASE_URL)/categories/beer.json"
        let categoryUrl = URL(string: categoryPath)!
        
        
        Alamofire.request(categoryUrl, withMethod: .get).responseJSON { response in
            debugPrint(response)     // prints detailed description of all response properties
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        completed()
    }
}
