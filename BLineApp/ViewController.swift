//
//  ViewController.swift
//  BLineApp
//
//  Created by sally everlove on 4/8/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

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
        
        let twoTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.twoTapped(_:)))
        twoTapRecognizer.numberOfTapsRequired = 1
        twoTapRecognizer.numberOfTouchesRequired = 2
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeLeft(_:)))
        swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirection.left
        
        let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeUp(_:)))
        swipeUpRecognizer.direction = UISwipeGestureRecognizerDirection.up
        
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeRight(_:)))
        swipeRightRecognizer.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeDown(_:)))
        swipeDownRecognizer.direction = UISwipeGestureRecognizerDirection.down
        
        //Add gestures to page
        self.view.addGestureRecognizer(singleTapRecognizer)
        self.view.addGestureRecognizer(doubleTapRecognizer)
        self.view.addGestureRecognizer(twoTapRecognizer)
        self.view.addGestureRecognizer(swipeLeftRecognizer)
        self.view.addGestureRecognizer(swipeUpRecognizer)
        self.view.addGestureRecognizer(swipeRightRecognizer)
        self.view.addGestureRecognizer(swipeDownRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //gesture functions
    func singleTapped(_ sender: UITapGestureRecognizer) {
        sendSMSText(phoneNumber: "8885555512")
        print("single tap")
        
    }
    
    func doubleTapped(_ sender: UITapGestureRecognizer) {
        print("double tap")
    }
    
    func twoTapped(_ sender: UITapGestureRecognizer) {
        print("two tap")
    }
    
    func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        print("swipe left")
    }

    func swipeUp(_ sender: UISwipeGestureRecognizer) {
        print("swipe up")
    }
    
    func swipeRight(_ sender: UISwipeGestureRecognizer) {
        print("swipe right")
    }
    
    func swipeDown(_ sender: UISwipeGestureRecognizer) {
        print("swipe down")
    }
    
    func sendSMSText(phoneNumber: String) {
        print("in sendSMSText")
        if (MFMessageComposeViewController.canSendText()) {
            print("in if")
            let controller = MFMessageComposeViewController()
            controller.body = "test"
            controller.recipients = [phoneNumber]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}

