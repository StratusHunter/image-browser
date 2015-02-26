//
//  ImageBrowserViewController.swift
//  ImageBrowser
//
//  Created by Terence Baker on 20/02/2015.
//  Copyright (c) 2015 Bulb Studios. All rights reserved.
//

import UIKit

class ImageBrowserViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView : UICollectionView!
    
    var imageArray = Array<Image>()
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        if (collectionView.delegate == nil) {
            
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as ImageCell
        
        cell.setupWithImage(imageArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        println("\(collectionView)")
        return collectionView.bounds.size
    }
}
