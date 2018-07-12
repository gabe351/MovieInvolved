//
//  MovieDetailViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 11/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController {
    
    override class var NAME : String { return "MovieDetail" }
    override class var ID : String { return "MovieDetailID" }
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden    = false
        self.navigationController?.topViewController?.title = "Movie detail"
        movieImageView.setImageFrom(url: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/6sVtz4UEgcFUqEOnFGPnGgoePow.jpg", placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
    }
}
