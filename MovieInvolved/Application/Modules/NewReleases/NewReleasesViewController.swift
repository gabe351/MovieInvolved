//
//  NewReleasesViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 08/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class NewReleasesViewController: BaseViewController {
    
    override class var NAME : String { return "NewReleases" }
    override class var ID : String { return "NewReleasesID" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden    = false
        self.navigationController?.topViewController?.title = "New releases"
    }
    
}
