//
//  Image.swift
//  ImageBrowser
//
//  Created by Terence Baker on 20/02/2015.
//  Copyright (c) 2015 Terence Baker. All rights reserved.
//

import Foundation

class Image {
    
    let farmId : Int
    let serverId : String
    let id : String
    let secret : String
    
    let imageURL : String
    
    init(json:Dictionary<String, AnyObject>) {
        
        farmId = json["farm"] as Int
        serverId = json["server"] as String
        id = json["id"] as String
        secret = json["secret"] as String
        
        imageURL = "https://farm\(farmId).staticflickr.com/\(serverId)/\(id)_\(secret)_m.jpg"
    }
}
