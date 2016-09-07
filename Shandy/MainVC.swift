//
//  MainVC.swift
//  Shandy
//
//  Created by Vitaliy on 26/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categories = [Category]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c1 = Category(title: "Beer", slug: "beer")
        let c2 = Category(title: "Cocktails", slug: "cocktails")
        let c3 = Category(title: "Cocoa", slug: "cocoa")
        let c4 = Category(title: "Coffee/Tea", slug: "coffee-tea")
        let c5 = Category(title: "Homemade Liqueur", slug: "homemade-liqueur")
        let c6 = Category(title: "Milk / Float / Shake", slug: "milk-shake")
        let c7 = Category(title: "Ordinary Drink", slug: "ordinary")
        let c8 = Category(title: "Punch / Party Drink", slug: "punch-party-drink")
        let c9 = Category(title: "Shot", slug: "shot")
        let c10 = Category(title: "Soft Drink / Soda", slug: "soft-drink-soda")
        let c11 = Category(title: "Other", slug: "other")

        downloadCategoriesData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
            
            let category = categories[indexPath.row]
            
            cell.updateUI(category: category)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return categories.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CategoryVC {
            let currentCell = tableView.indexPathForSelectedRow?.row
            destination.slug = categories[currentCell!].slug
        }
    }
    
    func downloadCategoriesData() {
        
        let categoriesPath = "\(BASE_URL)categories.json"
        let categoriesUrl = URL(string: categoriesPath)!
        
        Alamofire.request(categoriesUrl).responseJSON { response in
            debugPrint(response)     // prints detailed description of all response properties
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            print("JSON: \(response.result.value)")
            
            if let categoriesArray = response.result.value as? NSArray {
                for categoryDict in categoriesArray {
                    if let categoryDict = categoryDict as? NSDictionary {
                        //print("title: \(categoryDict["name"]!), slug: \(categoryDict["slug"]!)")
                        let category = Category(title: "\(categoryDict["name"]!)", slug: "\(categoryDict["slug"]!)")
                        self.categories.append(category)
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    private func appendCategoriesFromArray(array: NSArray) {
        
    }
}

