//
//  Setting.swift
//  BLineApp
//
//  Created by Kylie Hausch on 4/9/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit
import os.log

class Setting: NSObject, NSCoding
{
    //MARK: Properties
    var myAction: String
    var myResponse: String
    var title: String
    //var extraInfo: [String: String]
    
    
    //MARK: Acheiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("settings")

    
    //MARK: Types
    struct PropertyKey {
        static let myAction = "action"
        static let myResponse = "response"
        static let title = "title"
    }
    
    //MARK: Initialization
    init(myAction: String, myResponse: String, title: String) {
        
        //myAction: String, myResponse: String, title: String)
        /*if myAction.isEmpty || myResponse.isEmpty  {
            return nil
        }*/
        //super.init()
        
        self.myAction = myAction
        self.myResponse = myResponse
        self.title = title
        //self.extraInfo = [:]
    }
    
    func setAction(action: String) {
        self.myAction = action;
    }
    
    func setResponse(response: String) {
        self.myResponse = response
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(myAction, forKey: PropertyKey.myAction)
        aCoder.encode(myResponse, forKey: PropertyKey.myResponse)
        aCoder.encode(title, forKey: PropertyKey.title)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The title is required. If we cannot decode a name string, the initializer should fail.
        guard let title = aDecoder.decodeObject(forKey: PropertyKey.title) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        let myAction = aDecoder.decodeObject(forKey: PropertyKey.myAction)
        let myResponse = aDecoder.decodeObject(forKey: PropertyKey.myResponse)
        
        self.init(myAction: myAction as! String, myResponse: myResponse as! String, title: title)
        

    }
}
