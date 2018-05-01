//
//  AddResponseController.swift
//  BLineApp
//
//  Created by sally everlove on 4/27/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit


class AddResponseController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let sections = ["Apps"]
    let apps = ["Maps", "Health", "Contacts"]
    
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
            //apps Section
            return apps.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = apps[indexPath.row]
            break
        default:
            break
        }
        //cell.textLabel?.text = apps[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        var response = ""
        
        switch section {
        case 0:
            response = apps[row]
        default:
            response = ""
        }
        
        delegate?.userDidEnterResponse(info: response)
        _ = self.navigationController?.popViewController(animated: true)
        
        //print(indexPath.section)
    }
    
}
