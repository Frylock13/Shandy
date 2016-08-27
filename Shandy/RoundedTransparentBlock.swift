//
//  RoundedView.swift
//  Shandy
//
//  Created by Vitaliy on 27/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class RoundedTransparentBlock: UIView {

    override init (frame : CGRect) {
        super.init(frame : frame)
        
        self.backgroundColor = UIColor.blue
        
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
