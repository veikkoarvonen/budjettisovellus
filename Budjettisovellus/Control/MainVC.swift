//
//  ViewController.swift
//  Budjettisovellus
//
//  Created by Veikko Arvonen on 4.11.2025.
//

import UIKit

class MainVC: UIViewController {
    
    let dateManager = DateManager()
    let mainVCElements = MainVCElements()
    
    var topViews: [UIView] = []
    var categoryViews: [UIView] = []
    var addButton = UIView()
    
    var hasSetUI = false
    var currentDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetUI {
            setUpUI()
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            view.addGestureRecognizer(panGesture)
            hasSetUI = true
        }
        
    }
    
//MARK: - Pan Gesture
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        // Translation and velocity (useful for movement or animation logic)
        let translation = gesture.translation(in: view).x
        let velocity = gesture.velocity(in: view)
        
        switch gesture.state {
        case .began:
            // 👇 Called once when the gesture starts
            // → Typically used to prepare any views or variables you’ll need
            // e.g., determine swipe direction, prepare next view, etc.
            print("Pan began")

        case .changed:
            // 👇 Called continuously as the user drags
            // → Move your current/next views or update positions dynamically here
            // Example: move the view horizontally according to translation.x
            for topView in topViews {
                topView.transform = CGAffineTransform(translationX: translation, y: 0)
            }
            print("Pan changed (x: \(translation))")

        case .ended, .cancelled:
            // 👇 Called when user lifts their finger (or gesture is interrupted)
            // → Decide whether to complete the transition or revert
            // Example: if translation > threshold, animate to next view
            print("Pan ended with velocity \(velocity.x)")

            // Optionally reset translation so future pans start fresh
            gesture.setTranslation(.zero, in: view)

        case .failed:
            // 👇 Rarely triggered, but useful for debugging
            print("Pan failed")

        default:
            break
        }
    }

    
//MARK: - Set up UI
    
    private func setUpUI() {
        view.backgroundColor = UIColor(named: C.green2)
        let frame = view.frame
        let safeInsets = view.safeAreaInsets
        let calendar = Calendar.current
        
        for i in -1...1 {
            let dateForView = calendar.date(byAdding: .month, value: i, to: currentDate) ?? currentDate
            
            let topView = mainVCElements.createTopView(parentViewFrame: frame, safeAreInsets: safeInsets, forDate: dateForView, horizontalIndex: i)
            view.addSubview(topView)
            topViews.append(topView)
        }
        
        let addExpenceButton = mainVCElements.createAddButton(parentViewFrame: view.frame, safeAreaInsets: view .safeAreaInsets)
        view.addSubview(addExpenceButton)
        addButton = addExpenceButton
    }

}


/* MARK: Set UI */

extension MainVC {
    
    private func setUI() {
        view.backgroundColor = UIColor(named: C.green2)
        
        let topView = mainVCElements.createTopView(parentViewFrame: view.frame, safeAreInsets: view.safeAreaInsets, forDate: currentDate, horizontalIndex: 0)
        view.addSubview(topView)
        
        let categoryViews = mainVCElements.createCategoryViews(parentViewFrame: view.frame, safeAreaInsets: view.safeAreaInsets, fordate: currentDate, horizontalIndex: 0)
        
        for oneView in categoryViews {
            view.addSubview(oneView)
        }
        
        let addButton = mainVCElements.createAddButton(parentViewFrame: view.frame, safeAreaInsets: view .safeAreaInsets)
        view.addSubview(addButton)
        
    }
    
}

