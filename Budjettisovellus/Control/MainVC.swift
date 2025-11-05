//
//  ViewController.swift
//  Budjettisovellus
//
//  Created by Veikko Arvonen on 4.11.2025.
//

import UIKit

class MainVC: UIViewController {
    
    let dateManager = DateManager()
    
    var topView = UIView()
    var categoryViews: [UIView] = []
    
    var hasSetUI = false
    
    var currentDate = Date()

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
        setUpAddButton()
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
        
        //Top date label
        
        let labelMargin: CGFloat = 10
        let topViewDateLabelHeight: CGFloat = 40
        
        let topViewDateLabel = UILabel()
        topViewDateLabel.textColor = UIColor(named: C.green1)
        topViewDateLabel.text = dateManager.getDateHeader(for: currentDate)
        topViewDateLabel.textAlignment = .center
        topViewDateLabel.font = UIFont(name: C.latoBold, size: 25)
        topView.addSubview(topViewDateLabel)
        topViewDateLabel.frame = CGRect(x: labelMargin, y: labelMargin, width: topView.frame.width - labelMargin * 2, height: topViewDateLabelHeight)
        //topViewDateLabel.backgroundColor = .blue
        
        //Expence Label
        
        let expenceLabelY = labelMargin + 5 + topViewDateLabelHeight
        
        let expenceLabel = UILabel()
        expenceLabel.text = "Menot yhteensä: 1000€"
        expenceLabel.textAlignment = .center
        expenceLabel.font = UIFont(name: "Optima-Bold", size: 15)
        expenceLabel.textColor = .black
        topView.addSubview(expenceLabel)
        expenceLabel.frame = CGRect(x: labelMargin, y: expenceLabelY, width: topView.frame.width - labelMargin * 2, height: 15)
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
            
            
            let labelMargin: CGFloat = 10
            
            let categoryNames = Categories.categories
            
            let categoryNameLabel = UILabel()
            categoryNameLabel.text = categoryNames[i]
            categoryNameLabel.numberOfLines = 0
            categoryNameLabel.textAlignment = .center
            categoryNameLabel.textColor = UIColor(named: C.green1)
            categoryNameLabel.font = UIFont(name: C.latoBold, size: 15)
            categoryViews[i].addSubview(categoryNameLabel)
            categoryNameLabel.frame = CGRect(x: 0, y: labelMargin, width: categoryViewToInsert.frame.width, height: 15)
            
            let categoryExpenceLabelY: CGFloat = categoryViewToInsert.frame.height - labelMargin - 12
            
            let categoryExpenceLabel = UILabel()
            categoryExpenceLabel.text = "136.67€"
            categoryExpenceLabel.textAlignment = .center
            categoryExpenceLabel.textColor = .black
            categoryExpenceLabel.font = UIFont(name: "Optima-Bold", size: 12)
            categoryViews[i].addSubview(categoryExpenceLabel)
            categoryExpenceLabel.frame = CGRect(x: labelMargin, y: categoryExpenceLabelY, width: categoryViewToInsert.frame.width - labelMargin * 2, height: 12)
            
            let categoryEmojis = Categories.emojis
            
            let categoryEmojiLabel = UILabel()
            categoryEmojiLabel.textAlignment = .center
            categoryEmojiLabel.text = categoryEmojis[i]
            categoryEmojiLabel.font = UIFont(name: "Optima", size: 20)
            categoryViews[i].addSubview(categoryEmojiLabel)
            categoryEmojiLabel.frame = CGRect(x: categoryViewWidth / 2 - 25, y: categoryViewWidth / 2 - 25, width: 50, height: 50)
            
        }
        
        //Position category views
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
    
    private func setUpAddButton() {
        
        let addButtonLabel = UILabel()
        addButtonLabel.text = "+ Lisää Meno"
        addButtonLabel.font = UIFont(name: C.latoBold, size: 20)
        addButtonLabel.textColor = .white
        addButtonLabel.textAlignment = .center
        addButtonLabel.backgroundColor = UIColor(named: C.green1)
        
        // Rounded corners
        addButtonLabel.layer.cornerRadius = 20
        addButtonLabel.layer.masksToBounds = true
        
        // Shadow
        addButtonLabel.layer.shadowColor = UIColor.black.cgColor
        addButtonLabel.layer.shadowOpacity = 0.15
        addButtonLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
        addButtonLabel.layer.shadowRadius = 8
        
        let buttonWidth: CGFloat = 200
        let buttonHeigth: CGFloat = 40
        let viewMargin: CGFloat = 30
        let x = view.frame.width - buttonWidth - viewMargin
        let y = view.frame.height - view.safeAreaInsets.bottom - viewMargin - buttonHeigth
        
        
        view.addSubview(addButtonLabel)
        addButtonLabel.frame = CGRect(x: x, y: y, width: buttonWidth, height: buttonHeigth)
        
    }
    
    
}

