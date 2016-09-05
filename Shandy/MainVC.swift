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
        
        let c1 = Category(imageName: "beer.jpg", title: "Beer", slug: "beer")
        let c2 = Category(imageName: "cocktails.jpg", title: "Cocktails", slug: "cocktails")
        let c3 = Category(imageName: "cocoa.jpg", title: "Cocoa", slug: "cocoa")
        let c4 = Category(imageName: "coffee-tea.jpg", title: "Coffee/Tea", slug: "coffee-tea")
        let c5 = Category(imageName: "liqueur.jpg", title: "Homemade Liqueur", slug: "homemade-liqueur")
        let c6 = Category(imageName: "milk-shake.jpg", title: "Milk / Float / Shake", slug: "milk-shake")
        let c7 = Category(imageName: "ordinary.jpg", title: "Ordinary Drink", slug: "ordinary")
        let c8 = Category(imageName: "punch-party-drink.jpg", title: "Punch / Party Drink", slug: "punch-party-drink")
        let c9 = Category(imageName: "shot.jpg", title: "Shot", slug: "shot")
        let c10 = Category(imageName: "soft-drink-soda.jpg", title: "Soft Drink / Soda", slug: "soft-drink-soda")
        let c11 = Category(imageName: "other.jpg", title: "Other", slug: "other")
        
        categories.append(c1)
        categories.append(c2)
        categories.append(c3)
        categories.append(c4)
        categories.append(c5)
        categories.append(c6)
        categories.append(c7)
        categories.append(c8)
        categories.append(c9)
        categories.append(c10)
        categories.append(c11)
        
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
}

