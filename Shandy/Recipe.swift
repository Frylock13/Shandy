//
//  Recipe.swift
//  Shandy
//
//  Created by Vitaliy on 26/09/2016.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import Foundation

class Recipe {
    private var _name: String!
    private var _thumbUrl: String!
    
    var name: String {
        return _name
    }
    
    var thumbUrl: String {
        return _thumbUrl
    }
    
    init(name:String, thumbUrl:String) {
        _name = name
        _thumbUrl = thumbUrl
    }
}
