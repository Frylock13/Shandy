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
            
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                if let name = JSON["name"] as? String {
                    self.categoryTitleLabel.text = name
                }
            }
        }
    }
}
