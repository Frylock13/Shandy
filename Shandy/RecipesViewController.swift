//
//  RecipesViewController.swift
//  Shandy
//
//  Created by Vitaliy on 25/09/2016.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var _category: Category!
    
    var category: Category {
        get {
            return _category
        }
        set {
            _category = newValue
        }
    }
    
    var recipes: [Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = _category.title
        tableView.delegate = self
        tableView.dataSource = self
        
        let c1 = Recipe.init(name: "First", thumbUrl: "http://s3.eu-central-1.amazonaws.com/cocktails-production/ingredients/images/000/000/003/original/open-uri20160925-8029-26q1p9?1474820351")
        let c2 = Recipe.init(name: "Second", thumbUrl: "http://s3.eu-central-1.amazonaws.com/cocktails-production/ingredients/images/000/000/003/original/open-uri20160925-8029-26q1p9?1474820351")
        recipes.append(c1)
        recipes.append(c2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeCell {
            
            let recipe = recipes[indexPath.row]
            
            cell.updateUI(recipe: recipe)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
