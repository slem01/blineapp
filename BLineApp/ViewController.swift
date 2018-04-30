//
//  ViewController.swift
//  BLineApp
//
//  Created by sally everlove on 4/8/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let singleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.singleTapped(_:)))
        singleTapRecognizer.numberOfTapsRequired = 1
        singleTapRecognizer.numberOfTouchesRequired = 1
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.doubleTapped(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        singleTapRecognizer.require(toFail: doubleTapRecognizer)
        
        /*let twoTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.twoTapped(_:)))
        twoTapRecognizer.numberOfTapsRequired = 1
        twoTapRecognizer.numberOfTouchesRequired = 2*/
        
        /*let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeLeft(_:)))
        swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirection.left*/
        
        self.view.addGestureRecognizer(singleTapRecognizer)
        self.view.addGestureRecognizer(doubleTapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func singleTapped(_ sender: UITapGestureRecognizer) {
        
        print("single tap")
    }
    
    func doubleTapped(_ sender: UITapGestureRecognizer) {
        print("double tap")
    }
    
    /*func twoTapped(_ sender: UITapGestureRecognizer) {
        print("two tap")
    }*/
    
    /*func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        print("swipe left")
    }*/

}

