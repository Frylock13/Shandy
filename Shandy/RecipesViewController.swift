//
//  RecipesViewController.swift
//  Shandy
//
//  Created by Vitaliy on 25/09/2016.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    private var _category: Category!
    
    var category: Category {
        get {
            return _category
        }
        set {
            _category = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = _category.title
        
        //tableView.delegate = self
        //tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
