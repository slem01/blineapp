//
//  Setting.swift
//  BLineApp
//
//  Created by Kylie Hausch on 4/9/18.
//  Copyright © 2018 Shelby Lem. All rights reserved.
//

import UIKit

class Setting
{
    var myAction: String
    var myResponse: String
    var title: String
    
    init?(myAction: String, myResponse: String, title: String)
    {
        if myAction.isEmpty || myResponse.isEmpty  {
            return nil
        }
        self.myAction = myAction
        self.myResponse = myResponse
        self.title = title
    }
}
