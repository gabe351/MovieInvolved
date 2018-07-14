//
//  MyMoviesViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 08/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MyMoviesViewController: BaseViewController {
    
    override class var NAME : String { return "MyMovies" }
    override class var ID : String { return "MyMoviesID" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden    = false
        self.navigationController?.topViewController?.title = "My movies"
    }
}

