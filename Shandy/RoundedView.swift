//
//  RoundedView.swift
//  Shandy
//
//  Created by Vitaliy on 27/08/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

import UIKit

class RoundedView: UIView {


    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 3;
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
