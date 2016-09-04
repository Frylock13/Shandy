//
//  CategoryVC.swift
//  Shandy
//
//  Created by Vitaliy on 30/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
    
    private var _categoryTitle: String!
    
    var categoryTitle:String {
        get {
            return _categoryTitle
        }
        set {
            _categoryTitle = newValue
        }
    }
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        categoryTitleLabel.text = categoryTitle
    }
}
