//
//  HomeViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 29/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    override class var NAME : String { return "Home" }
    override class var ID : String { return "HomeID" }
                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ReleasesApiDataSourceImpl().allReleasesBy { (call) in
            
        }                
    }
}
