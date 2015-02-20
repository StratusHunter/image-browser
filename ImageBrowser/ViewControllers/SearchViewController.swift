//
//  ViewController.swift
//  ImageBrowser
//
//  Created by Terence Baker on 20/02/2015.
//  Copyright (c) 2015 Bulb Studios. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var textField : UITextField!
    private var mSearching = false
    private let mFlickrService = FlickrService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    @IBAction func searchButtonPressed() {
        
        if (!mSearching) {
            
            mSearching = true
            
            mFlickrService.searchWithKeywords(textField.text, onComplete: { [unowned self] (imageList:Array<Image>?) -> Void in
                
                self.mSearching = false
                
                if let images = imageList {
                    
                    let controller = self.storyboard!.instantiateViewControllerWithIdentifier("ImageBrowserViewController") as ImageBrowserViewController
                    controller.imageArray += images
                    self.navigationController!.pushViewController(controller, animated: true)
                }
                else {
                    
                    //Error
                }
            })
        }
    }
}

