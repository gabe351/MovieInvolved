//
//  SearchMovieViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 08/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class SearchMovieViewController: BaseViewController, SearchMovieViewContract, UISearchBarDelegate {
    
    override class var NAME : String { return "SearchMovie" }
    override class var ID : String { return "SearchMovieID" }
    
    @IBOutlet weak var moviesCollectionView: MoviesCollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let loader: LoadingViewController = LoadingViewController()
    
    lazy var presenter: SearchMoviePresenterContract = {
        return SearchMoviePresenter(view: self,
                                    getMovie: InjectionUseCase.provideGetMovies())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
        configureView()
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            return
        }
        
        presenter.findMovie(query: query)
    }
    
    func show(movies: [Movie]) {
        moviesCollectionView.movies = movies
        moviesCollectionView.reloadData()
    }
    
    func emptyList() {
        ToastBuilder(message: "none movies find", view: self.view)
            .with(position: .center)
            .show()
    }
    
    func onError() {
        ToastBuilder(message: "Error on request, check internet", view: self.view)
            .with(position: .center)
            .show()
    }
    
    func showLoader() {
        add(loader)
    }
    
    func hideLoader() {
        loader.remove()
    }
    
    private func configureView() {
        guard let navigationController = self.navigationController else {
            return
        }
        
        navigationController.isNavigationBarHidden = false
        navigationController.topViewController?.title = "Search movies"
        
        moviesCollectionView.setupWith(movies: [], navigationController: navigationController)
    }
}
