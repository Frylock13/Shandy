//
//  MainVC.swift
//  Shandy
//
//  Created by Vitaliy on 26/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categories = [Category]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c1 = Category(imageName: "beer.jpg", title: "Beer")
        let c2 = Category(imageName: "cocktails.jpg", title: "Cocktails")
        
        categories.append(c1)
        categories.append(c2)
        
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
    

}

