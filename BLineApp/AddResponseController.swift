//
//  AddResponseController.swift
//  BLineApp
//
//  Created by sally everlove on 4/27/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit


class AddResponseController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        delegate?.userDidEnterResponse(info: response)
        _ = self.navigationController?.popViewController(animated: true)
        
        //print(indexPath.section)
    }
    
}
