//
//  CategoryVC.swift
//  Shandy
//
//  Created by Vitaliy on 30/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit
import Alamofire

class CategoryVC: UIViewController {
    
    private var _category: Category!
    
    var category: Category {
        get {
            return _category
        }
        set {
            _category = newValue
        }
    }
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalRecipesCount: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        titleLabel.text = _category.title
        totalRecipesCount.text = _category.recipesCount
        descriptionView.text = _category.description
    }
}
