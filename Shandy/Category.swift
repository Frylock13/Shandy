//
//  Category.swift
//  Shandy
//
//  Created by Vitaliy on 27/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation

class Category {
    
    private var _imageName: String!
    private var _title: String!
 
    var imageName: String {
        get {
            return _imageName
        }
    }
    
    var title: String {
        get {
            return _title
        }
    }
    
    init(imageName: String, title: String) {
        _imageName = imageName
        _title = title
    }
}
