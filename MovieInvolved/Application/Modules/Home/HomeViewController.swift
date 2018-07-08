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
                
    @IBOutlet weak var searchMoviesButton: RoundedButton!
    @IBOutlet weak var releasesButton: RoundedButton!
    @IBOutlet weak var myMoviesButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTexts()
        
        ReleasesApiDataSourceImpl().allReleasesBy { (call) in
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func searchMovieDidPressed(_ sender: UIButton) {
        let viewController = UIStoryboard.loadViewController() as SearchMovieViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
        
    @IBAction func releasesDidPressed(_ sender: UIButton) {
        let viewController = UIStoryboard.loadViewController() as NewReleasesViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func myMoviesDidPressed(_ sender: UIButton) {
        let viewController = UIStoryboard.loadViewController() as MyMoviesViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func configureTexts() {
        searchMoviesButton.setTitle("Search Movies", for: .normal)
        releasesButton.setTitle("New Releases", for: .normal)
        myMoviesButton.setTitle("My Movies", for: .normal)
    }
}
