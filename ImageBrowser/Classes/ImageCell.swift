//
//  ImageCell.swift
//  ImageBrowser
//
//  Created by Terence Baker on 20/02/2015.
//  Copyright (c) 2015 Bulb Studios. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {

    @IBOutlet weak var imageView : UIImageView!
    
    func setupWithImage(image:Image) {
        
        imageView.sd_setImageWithURL(NSURL(string:image.imageURL))
    }
}
