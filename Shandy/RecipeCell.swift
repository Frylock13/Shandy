//
//  RecipeCell.swift
//  Shandy
//
//  Created by Vitaliy on 26/09/2016.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    
    func updateUI(recipe: Recipe) {
        titleLabel.text = recipe.name
        
        let thumbUrl = URL(string: recipe.thumbUrl)
        downloadImage(url: thumbUrl!)
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            DispatchQueue.main.sync() { () -> Void in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                self.thumbImage.image = UIImage(data: data)
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}