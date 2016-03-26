//
//  ViewController.swift
//  PaperMenuController
//
//  Created by Vinit Jasoliya on 3/26/16.
//  Copyright © 2016 ViNiT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var navController = SwiftAppMenuController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.translucent = false
        self.title = "Paper Menu"
        
      //Present Menu with a button in Navbar
        var rightItem: UIBarButtonItem = UIBarButtonItem()
        rightItem = UIBarButtonItem(title: "Menu", style: .Plain, target: self, action: "menuPressed")
        self.navigationItem.rightBarButtonItem = rightItem
        
        navController = self.navigationController as! SwiftAppMenuController
        navController.setNavigationBarHidden(true, animated: false) // Currently navBar hidden is true
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func menuPressed() {
        navController.openAndCloseMenu()
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.Down:
                print("Swiped down")
                menuPressed()
            case UISwipeGestureRecognizerDirection.Left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.Up:
                print("Swiped up")
                menuPressed()
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func MenuButtonPressed(sender: AnyObject) {
        menuPressed()
    }

}

