//
//  Image.swift
//  ImageBrowser
//
//  Created by Terence Baker on 20/02/2015.
//  Copyright (c) 2015 Bulb Studios. All rights reserved.
//

import Foundation

class Image {
    
    let farmId : String
    let serverId : String
    let id : String
    let secret : String
    
    let imageURL : String
    
    init(json:Dictionary<String, AnyObject>) {
        
        //TODO parse JSON
        farmId = ""
        serverId = ""
        id = ""
        secret = ""
        
        imageURL = "https://farm\(farmId).staticflickr.com/\(serverId)/\(id)_\(secret)_m.jpg"
    }
}
