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
    private var _slug: String!
    
    var imageName: String {
        return _imageName
    }
    
    var title: String {
        return _title
    }
    
    var slug: String {
        return _slug
    }
    
    init(title: String, slug: String) {
        _imageName = "\(slug).jpg"
        _title = title
        _slug = slug
    }
}
