//
//  SettingTableViewController.swift
//  BLineApp
//
//  Created by Kylie Hausch on 4/9/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    //MARK: Properties
    
    var settings = [Setting]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadSampleSettings()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settings.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SettingTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SettingTableViewCell

        // Configure the cell...
        let setting = settings[indexPath.row]
        cell?.settingLabel.text = setting.title

        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func loadSampleSettings() {
        var setting1 = Setting(myAction: "swipeLeft", myResponse: "volumeDown", title: "Turn Volume Down")
        var setting2 = Setting(myAction: "swipeRight", myResponse: "volumeUp", title: "Turn Volume Up")
        var setting3 = Setting(myAction: "oneTap", myResponse: "callHome", title: "Call Home")
        var setting4 = Setting(myAction: "twoTaps", myResponse: "textMom", title: "Text Mom \"Made it safe\"")
        var setting5 = Setting(myAction: "drawS", myResponse: "openSnap", title: "Open Snapchat")
        self.settings.append(setting1!)
        self.settings.append(setting2!)
        self.settings.append(setting3!)
        self.settings.append(setting4!)
        self.settings.append(setting5!)
    }

}
