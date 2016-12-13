//
//  ViewController.swift
//  AC3.2-Programmatic-Autolayout
//
//  Created by Louis Tur on 12/12/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var blueView: UIView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let viewDictionary = [ "superView" : self.view, "view1" : blueView ]
    
    // V = vertical axis 
    // H = horizontal axis
    // (value) tells you the "constant" of the constraint
    // | is shorthand for superview
    
    // these will break because the super view is > 50.0pts
    // but the view1 is defined as only having 50pt height
    // so it cannot be both pinned to the top and bottom edge of
    // a view that is >50.0 in heigh AND also be 50pts
    let constraint = "V:|[view1(50.0)]|"
    let constraint2 = "H:|[view1(100.0)]|"
    
    // - is a connection of 8pt
    // V -> Top-to-bottom
    // H -> Left-to-Right
    // pins to top left corner
    let constraint3 = "V:|[view1(50.0)]"
    let constraint4 = "H:|[view1(100.0)]"

    // pins to bottom right corner
    let constraint5 = "V:[view1(50.0)]|"
    let constraint6 = "H:[view1(100.0)]|"

    // pins to top right corner
    let constraint7 = "V:|[view1(50.0)]"
    let constraint8 = "H:[view1(100.0)]|"
    
    // pins to bottom left corner
    let constraint9 = "V:[view1(50.0)]|"
    let constraint10 = "H:|[view1(100.0)]"
    
    centerViewWithVFL()
    
  }
  
  
  
  internal func centerViewWithNSLayoutConstraint() {
    let blueWidthConstraint = NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)
    
    let blueHeightConstraint = NSLayoutConstraint(item: blueView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)
    
    let blueCenterXConstraint = NSLayoutConstraint(item: blueView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
    
    let blueCenterYConstraint =
    NSLayoutConstraint(item: blueView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
    
    blueView.translatesAutoresizingMaskIntoConstraints = false
    
    self.view.addConstraints([blueCenterYConstraint, blueCenterXConstraint])
    self.blueView.addConstraints([blueWidthConstraint, blueHeightConstraint])
  }
  
  
  
  internal func codeSnip() {
    let blueWidth = "H:[tobias(200.0)]"
    let blueHight = "V:[tobias(200.0)]"
    let views = ["tobias" : blueView,
                 "view" : self.view]
    blueView.translatesAutoresizingMaskIntoConstraints = false
    let blueWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: blueWidth, options: .alignAllCenterX, metrics: nil, views: views)
    
    let blueHeightConstraints = NSLayoutConstraint.constraints(withVisualFormat: blueHight, options: .alignAllCenterY, metrics: nil, views: views)
    
    NSLayoutConstraint.activate( blueHeightConstraints)
    NSLayoutConstraint.activate(blueWidthConstraints)
  }
  
  internal func centerViewWithVFL() {
    // visual format language
    let blueWidth = "H:[view]-(<=0.0)-[tobias(200.0)]"
    let blueHight = "V:[]-(<=0.0)-[tobias(200.0)]"
    let views = ["tobias" : blueView,
                 "view" : self.view]
    
    blueView.translatesAutoresizingMaskIntoConstraints = false
    let blueWidthConstraints = NSLayoutConstraint.constraints(withVisualFormat: blueWidth, options: .alignAllCenterY, metrics: nil, views: views)
    
    let blueHeightConstraints = NSLayoutConstraint.constraints(withVisualFormat: blueHight, options: .alignAllCenterX, metrics: nil, views: views)
    
    NSLayoutConstraint.activate( blueHeightConstraints)
    NSLayoutConstraint.activate(blueWidthConstraints)
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  /*
  internal func usingNSLayout() {
    let leftPinkConstraint = NSLayoutConstraint(item: pinkView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 8.0)
    let topPinkConstraint = NSLayoutConstraint(item: pinkView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 8.0)
    let widthPinkConstraint = NSLayoutConstraint(item: pinkView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0)
    let heightPinkConstraint = NSLayoutConstraint(item: pinkView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)
    
    pinkView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addConstraints([leftPinkConstraint, topPinkConstraint])
    self.pinkView.addConstraints([widthPinkConstraint, heightPinkConstraint])
    
    let leftGreenConstraint = NSLayoutConstraint(item: greenView, attribute: .leading, relatedBy: .equal, toItem: pinkView, attribute: .trailing, multiplier: 1.0, constant: 16.0)
    let rightGreenConstraint = NSLayoutConstraint(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -8.0)
    let topGreenConstraint = NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: pinkView, attribute: .top, multiplier: 1.0, constant: 0.0)
    let bottomGreenConstraint = NSLayoutConstraint(item: greenView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -16.0)
    
    greenView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addConstraints([leftGreenConstraint, rightGreenConstraint, bottomGreenConstraint, topGreenConstraint])
  }
  internal func usingVFL() {
    let metrics = [ "border" : 16, "hugeMargin" : 50 ]
    let views = [ "green" :  greenView, "pink" : pinkView]
    let horizontalLayout = "H:[green(50.0)]-|"
    let verticalLayout = "V:|-(hugeMargin)-[green]-(border)-|"
    
    let greenHorizontal = NSLayoutConstraint.constraints(withVisualFormat: horizontalLayout, options: [], metrics: metrics, views: views)
    let greenVertical = NSLayoutConstraint.constraints(withVisualFormat: verticalLayout, options: [], metrics: metrics, views: views)
    
    greenView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(greenHorizontal)
    NSLayoutConstraint.activate(greenVertical)
  }
  */
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

