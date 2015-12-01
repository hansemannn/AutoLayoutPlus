//
//  OldSchoolViewController.swift
//  iOS Example
//
//  Created by Rui Costa on 17/11/15.
//  Copyright © 2015 Rui Costa. All rights reserved.
//

import UIKit

class OldSchoolViewController: UIViewController {
    
    lazy var topContainer: UIView           = self.makeTopContainer()
    lazy var centerGreenContainer: UIView   = self.makeCenterContainer(UIColor.greenColor())
    lazy var centerBlueContainer: UIView    = self.makeCenterContainer(UIColor.blueColor())
    lazy var centerOrangeContainer: UIView  = self.makeCenterContainer(UIColor.orangeColor())
    lazy var bottomContainer: UIView        = self.makeBottomContainer()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        view.addSubview(topContainer)
        view.addSubview(centerBlueContainer)
        view.addSubview(centerGreenContainer)
        view.addSubview(centerOrangeContainer)
        view.addSubview(bottomContainer)
    }
    
    func setupConstraints() {
        let views = ["topContainer": topContainer, "centerBlueContainer": centerBlueContainer, "centerGreenContainer": centerGreenContainer, "centerOrangeContainer": centerOrangeContainer, "bottomContainer": bottomContainer]
        
        // Top container
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[topContainer(==60)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[topContainer]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        
        // Center views
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[centerBlueContainer(==200)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[centerBlueContainer(==100)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[centerGreenContainer(==180)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[centerGreenContainer(==80)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[centerOrangeContainer(==160)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[centerOrangeContainer(==60)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        
        view.addConstraint(NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: centerBlueContainer, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: centerGreenContainer, attribute: .CenterY, relatedBy: .Equal, toItem: centerBlueContainer, attribute: .CenterY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: centerGreenContainer, attribute: .CenterX, relatedBy: .Equal, toItem: centerBlueContainer, attribute: .CenterX, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: centerOrangeContainer, attribute: .CenterY, relatedBy: .Equal, toItem: centerBlueContainer, attribute: .CenterY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: centerOrangeContainer, attribute: .CenterX, relatedBy: .Equal, toItem: centerBlueContainer, attribute: .CenterX, multiplier: 1, constant: 0))
        
        // Bottom container
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[bottomContainer]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bottomContainer]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraint(NSLayoutConstraint(item: centerOrangeContainer, attribute: .Height, relatedBy: .Equal, toItem: topContainer, attribute: .Height, multiplier: 1, constant: 0))
        
    }
    
    func makeTopContainer() -> UIView {
        let t = UIView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = UIColor.yellowColor()
        
        let leftArea = UIView()
        leftArea.translatesAutoresizingMaskIntoConstraints = false
        leftArea.backgroundColor = UIColor.greenColor()
        
        let centerArea = UIView()
        centerArea.translatesAutoresizingMaskIntoConstraints = false
        centerArea.backgroundColor = UIColor.blueColor()
        
        let rightArea = UIView()
        rightArea.translatesAutoresizingMaskIntoConstraints = false
        rightArea.backgroundColor = UIColor.blackColor()
        
        t.addSubview(leftArea)
        t.addSubview(centerArea)
        t.addSubview(rightArea)
        
        // Constraints
        
        let views = ["leftArea": leftArea, "centerArea": centerArea, "rightArea": rightArea]
        
        t.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[leftArea]|", options: .AlignAllCenterY, metrics: nil, views: views))
        t.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[leftArea(==60)][centerArea][rightArea(==leftArea)]|", options: .AlignAllCenterY, metrics: nil, views: views))
        t.addConstraint(NSLayoutConstraint(item: leftArea, attribute: .CenterY, relatedBy: .Equal, toItem: t, attribute: .CenterY, multiplier: 1, constant: 0))
        
        t.addConstraint(NSLayoutConstraint(item: centerArea, attribute: .Height, relatedBy: .Equal, toItem: leftArea, attribute: .Height, multiplier: 1, constant: 0))
        t.addConstraint(NSLayoutConstraint(item: rightArea, attribute: .Height, relatedBy: .Equal, toItem: leftArea, attribute: .Height, multiplier: 1, constant: 0))
        
        return t
    }
    
    func makeCenterContainer(backgroundColor: UIColor) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = backgroundColor
        
        return v
    }
    
    func makeBottomContainer() -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.redColor()
        
        return v
    }
    
}