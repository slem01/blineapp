//
//  AddSettingController.swift
//  BLineApp
//
//  Created by sally everlove on 4/30/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit
import os.log

//var mySetting: Setting = Setting()

class AddSettingController: UIViewController, DataEnteredDelegate {
    
    @IBOutlet weak var addActionButton: UIButton!
    @IBOutlet weak var addResponseButton: UIButton!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var setting: Setting?
    var action: String = ""
    var response: String = ""
    var t: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let setting = setting {
            action = setting.myAction
            response = setting.myResponse
            t = setting.title
            addActionButton.setTitle(setting.myAction, for: .normal)
            addResponseButton.setTitle(setting.myResponse, for: .normal)
            
        }
        if action == "" && response == "" {
            saveButton.isEnabled = false
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "addActionSegue" {
            let secondViewController = segue.destination as! AddActionController
            secondViewController.delegate = self
        } else if segue.identifier == "addResponseSegue" {
            let secondViewController = segue.destination as! AddResponseController
            secondViewController.delegate = self
        }
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        if t == "" {
            t = "Test Title"
        }
        setting = Setting(myAction: action, myResponse: response, title: t)
        
    }
    
    func userDidEnterInformation(info: String) {
        addActionButton.setTitle(info, for: .normal)
        //setting?.myAction = info
        //setting?.title = "Test Title"
        action = info
        if response != "" {
            saveButton.isEnabled = true
        }

    }
    
    func userDidEnterResponse(info: String) {
        addResponseButton.setTitle(info, for: .normal)
        //setting?.myResponse = info
        response = info
        if action != "" {
            saveButton.isEnabled = true
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddSettingMode = presentingViewController is UINavigationController
        if isPresentingInAddSettingMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
        dismiss(animated: true, completion: nil)
    }
    
}
