//
//  MainVCElements.swift
//  Budjettisovellus
//
//  Created by Veikko Arvonen on 5.11.2025.
//

import UIKit

struct MainVCElements {
        
    func createTopView(parentViewFrame: CGRect, safeAreInsets: UIEdgeInsets, forDate date: Date, horizontalIndex: Int) -> UIView {
        
        let dateManager = DateManager()
        let margin = ViewMargins.viewMargin
     
//MARK: - TopView
        
        let topView = UIView()
        topView.backgroundColor = .white
        
        //Frame
        let topViewWidth = parentViewFrame.width - margin * 2
        let topViewHeigth: CGFloat = ViewMargins.topViewHeigth
        let topViewX = margin + parentViewFrame.width * CGFloat(horizontalIndex)
        let topViewY = margin + safeAreInsets.top
        topView.frame = CGRect(x: topViewX, y: topViewY, width: topViewWidth, height: topViewHeigth)
        
        // Rounded corners
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = false
        
        // Shadow
        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.shadowOpacity = 0.15
        topView.layer.shadowOffset = CGSize(width: 0, height: 4)
        topView.layer.shadowRadius = 8
        
//MARK: - Date Label
        
        let topViewDateLabel = UILabel()
        topViewDateLabel.textColor = UIColor(named: C.green1)
        topViewDateLabel.text = dateManager.getDateHeader(for: date)
        topViewDateLabel.textAlignment = .center
        topViewDateLabel.font = UIFont(name: C.latoBold, size: 25)
        topView.addSubview(topViewDateLabel)
        topViewDateLabel.frame = CGRect(x: margin, y: 15, width: topView.frame.width - margin * 2, height: 25.0)
        
//MARK: Expence Label

        let expenceLabel = UILabel()
        expenceLabel.text = "Menot yhteensä: 1000€"
        expenceLabel.textAlignment = .center
        expenceLabel.font = UIFont(name: "Optima-Bold", size: 15)
        expenceLabel.textColor = .black
        topView.addSubview(expenceLabel)
        let expenceLabelY = 50.0
        expenceLabel.frame = CGRect(x: margin, y: expenceLabelY, width: topView.frame.width - margin * 2, height: 15)
        
        return topView
        
    }
    
    func createCategoryViews(parentViewFrame: CGRect, safeAreaInsets: UIEdgeInsets, fordate date: Date, horizontalIndex: Int) -> [UIView] {
        
        var viewsToReturn: [UIView] = []
        
        let margin = ViewMargins.viewMargin
        let gap = ViewMargins.viewGap
        let categories = Categories.categories
        let emojis = Categories.emojis
        
        let categoryBoxSize = (parentViewFrame.width - margin * 2 - gap * 2) / 3
        let categoryLabelMargin = ViewMargins.categoryViewMargin
     
//MARK: - Category View
        
        var xIndex = 0
        var yIndex = 0
        let interval = categoryBoxSize + gap
        
        for i in 0...8 {
            
            let categoryView = UIView()
            categoryView.backgroundColor = .white
            
            // Rounded corners
            categoryView.layer.cornerRadius = 20
            categoryView.layer.masksToBounds = false
            
            // Shadow
            categoryView.layer.shadowColor = UIColor.black.cgColor
            categoryView.layer.shadowOpacity = 0.15
            categoryView.layer.shadowOffset = CGSize(width: 0, height: 4)
            categoryView.layer.shadowRadius = 8
            
            let xPosition = margin + interval * CGFloat(xIndex) + parentViewFrame.width * CGFloat(horizontalIndex)
            let yPosition = safeAreaInsets.top + margin * 2 + ViewMargins.topViewHeigth + CGFloat(yIndex) * interval
            
            categoryView.frame = CGRect(x: xPosition, y: yPosition, width: categoryBoxSize, height: categoryBoxSize)
            
            if xIndex == 2 {
                xIndex = 0
                yIndex += 1
            } else {
                xIndex += 1
            }
            
            
            
//MARK: - Category Name
            
            let categoryNameLabel = UILabel()
            categoryNameLabel.text = categories[i]
            categoryNameLabel.numberOfLines = 0
            categoryNameLabel.textAlignment = .center
            categoryNameLabel.textColor = UIColor(named: C.green1)
            categoryNameLabel.font = UIFont(name: C.latoBold, size: 15)
            categoryView.addSubview(categoryNameLabel)
            categoryNameLabel.frame = CGRect(x: 0, y: categoryLabelMargin, width: categoryBoxSize, height: 15)
            
//MARK: - Emojis
            
            let emojiXY = categoryBoxSize / 2 - 25
            
            let categoryEmojiLabel = UILabel()
            categoryEmojiLabel.textAlignment = .center
            categoryEmojiLabel.text = emojis[i]
            categoryEmojiLabel.font = UIFont(name: "Optima", size: 20)
            categoryView.addSubview(categoryEmojiLabel)
            categoryEmojiLabel.frame = CGRect(x: emojiXY, y: emojiXY, width: 50, height: 50)
            
//MARK: - Expences spent
            
            let expenceLabelY = categoryBoxSize - 12 - categoryLabelMargin
            
            let categoryExpenceLabel = UILabel()
            categoryExpenceLabel.text = "136.67€"
            categoryExpenceLabel.textAlignment = .center
            categoryExpenceLabel.textColor = .black
            categoryExpenceLabel.font = UIFont(name: "Optima-Bold", size: 12)
            categoryView.addSubview(categoryExpenceLabel)
            categoryExpenceLabel.frame = CGRect(x: 0, y: expenceLabelY, width: categoryBoxSize, height: 12)
            
            viewsToReturn.append(categoryView)
            
        }
        
        return viewsToReturn
        
    }
    
    func createAddButton(parentViewFrame: CGRect, safeAreaInsets: UIEdgeInsets) -> UIView {
        
        let buttonWidth: CGFloat = 200
        let buttonHeigth: CGFloat = 40
        let buttonX = parentViewFrame.width - ViewMargins.viewMargin - buttonWidth
        let buttonY = parentViewFrame.height - safeAreaInsets.bottom - ViewMargins.viewMargin - buttonHeigth
        
        let addButtonView = UIView()
        addButtonView.backgroundColor = UIColor(named: C.green1)
        
        // Rounded corners
        addButtonView.layer.cornerRadius = 20
        addButtonView.layer.masksToBounds = false
        
        // Shadow
        addButtonView.layer.shadowColor = UIColor.black.cgColor
        addButtonView.layer.shadowOpacity = 0.15
        addButtonView.layer.shadowOffset = CGSize(width: 0, height: 4)
        addButtonView.layer.shadowRadius = 8
        
        addButtonView.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeigth)
        
        let addButtonLabel = UILabel()
        addButtonLabel.text = "+ Lisää Meno"
        addButtonLabel.font = UIFont(name: C.latoBold, size: 20)
        addButtonLabel.textColor = .white
        addButtonLabel.textAlignment = .center
        
        addButtonView.addSubview(addButtonLabel)
        
        addButtonLabel.frame = CGRect(x: 10, y: 10, width: buttonWidth - 20, height: buttonHeigth - 20)
        
        return addButtonView
        
    }
    
}
