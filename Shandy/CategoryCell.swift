//
//  CategoryCell.swift
//  Shandy
//
//  Created by Vitaliy on 27/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateUI(category: Category) {
        let preparedImage = UIImage(named: category.imageName)
        
        categoryName.text = category.title
        categoryImage.image = preparedImage// UIImageView(image: preparedImage!)
    }
}
