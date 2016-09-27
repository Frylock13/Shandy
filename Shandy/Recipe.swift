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
    private var _ingredientsList: String!
    private var _glassName: String!
    
    var name: String {
        return _name
    }
    
    var thumbUrl: String {
        return _thumbUrl
    }
    
    var ingredientsList: String {
        if _ingredientsList == nil {
            return ""
        }
        return _ingredientsList
    }
    
    var glassName: String {
        return _glassName
    }
    
    init(name:String, thumbUrl:String, ingredientsList: String, glassName: String) {
        _name = name
        _thumbUrl = thumbUrl
        _ingredientsList = ingredientsList
        _glassName = glassName
    }
}
