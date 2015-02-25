//
//  FlickrService.swift
//  ImageBrowser
//
//  Created by Terence Baker on 20/02/2015.
//  Copyright (c) 2015 Bulb Studios. All rights reserved.
//

import UIKit
import Alamofire

class FlickrService {

    private let apiKey = "cb80c3124a3bc08594b1a3c08e768583"
    private let apiSecret = "ccf6017957c37492"
    private let apiURL: String

    init() {

        apiURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&format=json&nojsoncallback=1&safe_search=1&content_type=1&media=photos&text="
    }

    func searchWithKeywords(keywords: String, onComplete: (imageList:Array<Image>?) -> Void) {

        if let text = keywords.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {

            let url = apiURL + text

            Alamofire.request(.GET, url).responseJSON {(_, _, JSON, _) in
                
                if let jsonObject = JSON as? Dictionary<String, AnyObject> {
                
                    let imageList = self.parseJSON(jsonObject)
                    onComplete(imageList: (imageList.count == 0) ? nil : imageList)
                }
                else {
                    
                    onComplete(imageList: nil)
                }
            }
        }
        else {

            onComplete(imageList: nil)
        }
    }
    
    func parseJSON(imageJSON:Dictionary<String, AnyObject>) -> Array<Image> {
        
        var imageList = Array<Image>()
        
        let photoDict = imageJSON["photos"] as Dictionary<String, AnyObject>
        let photoArray = photoDict["photo"] as Array<Dictionary<String, AnyObject>>
        
        for photo in photoArray {
        
            imageList.append(Image(json: photo))
        }
        
        return imageList
    }
}
