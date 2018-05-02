//
//  MySettingsController.swift
//  BLineApp
//
//  Created by sally everlove on 4/9/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit
import os.log

class MySettingsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var settings = [Setting]()
    
    private func loadSampleSettings() {
        let setting1 = Setting(myAction: "Single Tap", myResponse: "Send Text", title: "Text Shelby")

        let setting2 = Setting(myAction: "Double Tap", myResponse: "Flash Light", title: "Turn On Flash Light")
        
        self.settings += [setting1, setting2]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleSettings()
        
        // Use the edit button item provided by the table view controller.
        //navigationItem.leftBarButtonItem = editButtonItem
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMySettings(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddSettingController, let thisSetting = sourceViewController.setting {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                settings[selectedIndexPath.row] = thisSetting
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                print("update")
            } else {
                // Add a new meal.
                let newIndexPath = IndexPath(row: settings.count, section: 0)
                
                settings.append(thisSetting)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                print("new")
            }
            
            // Add a new meal.
            //let newIndexPath = IndexPath(row: settings.count, section: 0)
            
            //settings.append(thisSetting)
            //tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("test")

        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "AddSegue":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let addSettingViewController = segue.destination as? AddSettingController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedSettingCell = sender as? settingCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedSettingCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedSetting = settings[indexPath.row]
            addSettingViewController.setting = selectedSetting
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cellIdentifier = "SettingTableViewCell"

        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath) as? settingCell
        
        cell?.textLabel?.text = settings[indexPath.row].title
        return cell!
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            settings.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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
