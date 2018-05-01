//
//  MySettingsController.swift
//  BLineApp
//
//  Created by sally everlove on 4/9/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit

class MySettingsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var settings = [Setting]()
    
    private func loadSampleSettings() {
        let setting1 = Setting(myAction: "Single Tap", myResponse: "Send Text", title: "Text Shelby")

        let setting2 = Setting(myAction: "Double Tap", myResponse: "Flash Light", title: "Turn On Flash Light")
        
        self.settings += [setting1, setting2]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleSettings()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        cell.textLabel?.text = settings[indexPath.row].title
        return cell
    }
    
    /*private func saveSettings() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(settings, toFile: Setting.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Settings successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save settings...", log: OSLog.default, type: .error)
        }
    }*/
    
}
