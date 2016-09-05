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
    
    private var _slug: String!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var totalRecipesCount: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    var slug:String {
        get {
            return _slug
        }
        set {
            _slug = newValue
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
        
        getJSONAndUpdateUI()
    }
    
    func getJSONAndUpdateUI() {
        //categoryTitleLabel.text = currentCategory.name
        let categoryPath = "\(BASE_URL)categories/\(slug).json"
        let categoryUrl = URL(string: categoryPath)!
        
        Alamofire.request(categoryUrl, withMethod: .get).responseJSON { response in
            debugPrint(response)     // prints detailed description of all response properties
            
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            print("JSON: \(response.result.value)")
            
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                if let name = JSON["name"] as? String {
                    self.categoryTitleLabel.text = name
                }
                
                if let recipesCount = JSON["recipes_count"] as? Int {
                    self.totalRecipesCount.text = "\(recipesCount)"
                }
                
                if let description = JSON["description"] as? String {
                    self.descriptionView.text = description
                }
            }
        }
    }
}
