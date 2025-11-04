//
//  ViewController.swift
//  Budjettisovellus
//
//  Created by Veikko Arvonen on 4.11.2025.
//

import UIKit

class MainVC: UIViewController {
    
    var topView = UIView()
    var categoryViews: [UIView] = []
    
    var hasSetUI = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetUI {
            setUpUI()
            hasSetUI = true
        }
        
    }

}


/* MARK: Set UI */

extension MainVC {
    
    private func setUpUI() {
        view.backgroundColor = UIColor(named: C.green2)
        setUpTopView()
        setUICategoryViews()
    }
    
    private func setUpTopView() {
        
        let containerMargin: CGFloat = 30
        let topSafeGap = view.safeAreaInsets.top
        
        //Top view
        let topViewToInsert = UIView()
        topViewToInsert.backgroundColor = .white
        
        //Frame
        let topViewX = containerMargin
        let topViewY = containerMargin + topSafeGap
        let topViewWidth = view.frame.width - (containerMargin * 2)
        let topViewHeight: CGFloat = 200
        topViewToInsert.frame = CGRect(x: topViewX, y: topViewY, width: topViewWidth, height: topViewHeight)
        
        // Rounded corners
        topViewToInsert.layer.cornerRadius = 20
        topViewToInsert.layer.masksToBounds = false
        
        // Shadow
        topViewToInsert.layer.shadowColor = UIColor.black.cgColor
        topViewToInsert.layer.shadowOpacity = 0.15
        topViewToInsert.layer.shadowOffset = CGSize(width: 0, height: 4)
        topViewToInsert.layer.shadowRadius = 8
        
        view.addSubview(topViewToInsert)
        topView = topViewToInsert
    }
    
    private func setUICategoryViews() {
        
        let containerMargin: CGFloat = 30
        let boxGap: CGFloat = 15
        let categoryViewWidth = (view.frame.width - (containerMargin * 2) - (boxGap * 2)) / 3
        
        for i in 0...8 {
            
            let categoryViewToInsert = UIView()
            categoryViewToInsert.backgroundColor = .white
            
            
            categoryViewToInsert.frame = CGRect(x: 100, y: 400, width: categoryViewWidth, height: categoryViewWidth)
            
            // Rounded corners
            categoryViewToInsert.layer.cornerRadius = 20
            categoryViewToInsert.layer.masksToBounds = false
            
            // Shadow
            categoryViewToInsert.layer.shadowColor = UIColor.black.cgColor
            categoryViewToInsert.layer.shadowOpacity = 0.15
            categoryViewToInsert.layer.shadowOffset = CGSize(width: 0, height: 4)
            categoryViewToInsert.layer.shadowRadius = 8
            
            view.addSubview(categoryViewToInsert)
            categoryViews.append(categoryViewToInsert)
            
        }
        
        var xIndex: CGFloat = 0
        var yIndex: CGFloat = 0
        let firstX = containerMargin + (categoryViewWidth / 2)
        let firstY = view.safeAreaInsets.top + containerMargin * 2 + 200 + categoryViewWidth / 2
        let centerDistance = categoryViewWidth + boxGap
        
        
        for i in 0..<categoryViews.count {
            categoryViews[i].center = CGPoint(x: firstX + xIndex * centerDistance, y: firstY + yIndex * centerDistance)
            
            if xIndex == 2 {
                xIndex = 0
                yIndex += 1
            } else {
                xIndex += 1
            }
        }
        
    }
    
    
}

