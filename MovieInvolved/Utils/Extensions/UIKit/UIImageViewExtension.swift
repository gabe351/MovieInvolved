//
//  UIImageViewExtension.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 09/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    open func setImageFrom(url: String, placeholder: UIImage!) {
        
        let urlWithoutSpace = url.trim().replacingOccurrences(of: " ", with: "%20")
        
        self.sd_setImage(with: NSURL(string: urlWithoutSpace) as URL?, placeholderImage: placeholder)
    }
    
    open func setImageFrom(url: String){
        
        let urlWithoutSpace = url.trim().replacingOccurrences(of: " ", with: "%20")
        
        self.sd_setImage(with: NSURL(string: urlWithoutSpace) as URL?)
        
    }
}

