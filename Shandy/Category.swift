//
//  Category.swift
//  Shandy
//
//  Created by Vitaliy on 27/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation

class Category {
    
    private var _title: String!
    private var _slug: String!
    private var _description: String!
    private var _recipesCount: String!
    private var _thumbUrl: String!
    
    var title: String {
        return _title
    }
    
    var slug: String {
        return _slug
    }
    
    var description: String {
        return _description
    }
    
    var recipesCount: String {
        return _recipesCount
    }
    
    var thumbUrl: String {
        return _thumbUrl
    }
    
    init(title: String, slug: String, description: String, recipesCount: String, thumbUrl: String) {
        _title = title
        _slug = slug
        _description = description
        _recipesCount = recipesCount
        _thumbUrl = thumbUrl
    }
}
