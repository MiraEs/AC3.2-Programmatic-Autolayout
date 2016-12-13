//
//  ViewController.swift
//  AC3.2-Programmatic-Autolayout
//
//  Created by Louis Tur on 12/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func layoutSubviews() {
        let blueWidth = "H:[tobias(200.0)]"
        let blueHight = "V:[tobias(200.0)]"
        let views = ["tobias" : blueView,
                     "view" : self.view]
        blueView.translatesAutoresizingMaskIntoConstraints = false
        let blueWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: blueWidth, options: .alignAllCenterX, metrics: nil, views: views)
        
        let blueHeightConstraints = NSLayoutConstraint.constraints(withVisualFormat: blueHight, options: .alignAllCenterY, metrics: nil, views: views)
        
        //align x and y
        let blueXConstraints = NSLayoutConstraint.constraints(withVisualFormat: <#T##String#>, options: .alignAllCenterX, metrics: nil, views: views)
        NSLayoutConstraint.activate(blueHeightConstraints)
        NSLayoutConstraint.activate(blueWidthConstraints)
        
    }
    
}

