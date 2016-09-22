//
//  RoundedView.swift
//  Shandy
//
//  Created by Vitaliy on 22/09/2016.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    func customInit() {
        self.layer.cornerRadius = 3
        self.layer.shadowColor = UIColor(white: 0, alpha: 1).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3
    }
}
