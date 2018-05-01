//
//  AddSettingController.swift
//  BLineApp
//
//  Created by sally everlove on 4/30/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit

//var mySetting: Setting = Setting()

class AddSettingController: UIViewController, DataEnteredDelegate {
    
    @IBOutlet weak var addActionButton: UIButton!
    @IBOutlet weak var addResponseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addActionSegue" {
            let secondViewController = segue.destination as! AddActionController
            secondViewController.delegate = self
        } else if segue.identifier == "addResponseSegue" {
            let secondViewController = segue.destination as! AddResponseController
            secondViewController.delegate = self
        }
    }
    
    func userDidEnterInformation(info: String) {
        addActionButton.setTitle(info, for: .normal)
        //print("test")
        //print(info)

    }
    
    func userDidEnterResponse(info: String) {
        addResponseButton.setTitle(info, for: .normal)
    }
    
    func save() {
        
    }
    
    func cancel() {
        
    }
    
}
