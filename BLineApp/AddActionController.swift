//
//  AddActionController.swift
//  BLineApp
//
//  Created by sally everlove on 4/26/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit

protocol DataEnteredDelegate: class {
    func userDidEnterInformation(info: String)
    func userDidEnterResponse(info: String)
}

class AddActionController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    let sections = ["Tap", "Swipe"]
    let tap = ["Single Tap", "Double Tap"]
    let swipe = ["Swipe Left", "Swipe Up", "Swipe Right", "Swipe Down"]
    
    weak var delegate: DataEnteredDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            //Tap Section
            return tap.count
        case 1:
            //Swipe Section
            return swipe.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        switch indexPath.section {
        case 0:
            //Tap Section
            cell.textLabel?.text = tap[indexPath.row]
            break
        case 1:
            //Swipe Section
            cell.textLabel?.text = swipe[indexPath.row]
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        var action = ""

        switch section {
        case 0:
            action = tap[row]
        case 1:
            action = swipe[row]
        default:
            action = ""
        }
        
        delegate?.userDidEnterInformation(info: action)
        _ = self.navigationController?.popViewController(animated: true)
        //self.myAdd?.onUserAction(data: action)
        
        //print(indexPath.section)
    }
    
    
}


