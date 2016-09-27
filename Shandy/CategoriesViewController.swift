//
//  MainVC.swift
//  Shandy
//
//  Created by Vitaliy on 26/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categories = [Category]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadCategoriesDataFromJson()
        
        self.navigationItem.title = "Categories"
        
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
        if let destination = segue.destination as? RecipesViewController {
            let currentCell = tableView.indexPathForSelectedRow?.row
            destination.category = categories[currentCell!]
        }
    }
    
    func downloadCategoriesDataFromJson() {
        
        let categoriesPath = "\(BASE_URL)/categories.json"
        let categoriesUrl = URL(string: categoriesPath)!
        
        Alamofire.request(categoriesUrl).responseJSON { response in
            debugPrint(response)     // prints detailed description of all response properties

            print("JSON: \(response.result.value)")
            
            self.addCategoriesToAnArray(array: response.result.value as! NSArray)
        }
    }
    
    private func addCategoriesToAnArray(array: NSArray) {
        for categoryDict in array {
            if let categoryDict = categoryDict as? NSDictionary {
                let category = Category(id: categoryDict["id"]! as! Int, name: "\(categoryDict["name"]!)", slug: "\(categoryDict["slug"]!)", description: "\(categoryDict["description"]!)", recipesCount: "\(categoryDict["recipes_count"]!)", thumbUrl: "\(categoryDict["thumb_url"]!)")
                self.categories.append(category)
                self.tableView.reloadData()
            }
        }
    }
}

