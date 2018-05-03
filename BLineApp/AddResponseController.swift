//
//  AddResponseController.swift
//  BLineApp
//
//  Created by sally everlove on 4/27/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit


class AddResponseController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let apps = ["Toggle Flash Light", "Make Call", "Send Text", "Call on Facetime", "Open Website in Safari", "Open Instagram", "Open Apple Music", "Open Maps", "Open Facebook", "Open Facebook Message", "Open Snapchat", "Open Spotify", "Open Waze", "Open Youtube", "Open Pinterest"]
    let needsMoreData = ["Make Call", "Send Text", "Call on Facetime", "Open Website in Safari"]
    
    weak var delegate: DataEnteredDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        cell.textLabel?.text = apps[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        var response = ""
        
        response = apps[row]
        
        for need in needsMoreData {
            if response == need {
                showInputDialog()
            }
        }

        delegate?.userDidEnterResponse(info: response)
        _ = self.navigationController?.popViewController(animated: false)
        
        
        //print(indexPath.section)
    }
    
    
    
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "More Details", message: "Enter phone number", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            let phone = alertController.textFields?[0].text

            
            //self.labelMessage.text = "Name: " + name! + "Email: " + email!
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "phone number"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
 
}
