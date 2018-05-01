//
//  HomeViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 29/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    public static let NIB_NAME = "Home"
    public static let ID       = "HomeId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReleasesApiDataSourceImpl().allReleasesBy { (call) in
            
        }                
    }    
    
}
