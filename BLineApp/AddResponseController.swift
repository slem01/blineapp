//
//  AddResponseController.swift
//  BLineApp
//
//  Created by sally everlove on 4/27/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit

class AddResponseController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let sections = ["Fruit", "Vegetables"]
    let fruit = ["Apple", "Orange", "Mango"]
    let vegetables = ["Carrot", "Broccoli", "Cucumber"]
    
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
            //Fruit Section
            return fruit.count
        case 1:
            //Vegetable Section
            return vegetables.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlainCell", for: indexPath)
        switch indexPath.section {
        case 0:
            //Fruit Section
            cell.textLabel?.text = fruit[indexPath.row]
            break
        case 1:
            //Vegetable Section
            cell.textLabel?.text = vegetables[indexPath.row]
            break
        default:
            break
        }
        return cell
    }
}
