//
//  MyMoviesViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 08/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MyMoviesViewController: BaseViewController, MyMoviesViewContract {
    
    override class var NAME : String { return "MyMovies" }
    override class var ID : String { return "MyMoviesID" }
    
    @IBOutlet weak var moviesCollectionView: MoviesCollectionView!
    
    lazy var presenter: MyMoviesPresenterContract = {
        return MyMoviesPresenter(view: self,
                                 getMovie: InjectionUseCase.provideGetMovies())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
        moviesCollectionView.contract = self
        presenter.loadMovies()
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
    
    private func configureView() {
        guard let navigationController = self.navigationController else {
            return
        }
        
        navigationController.isNavigationBarHidden    = false
        navigationController.topViewController?.title = "My movies"
        
        moviesCollectionView.setupWith(movies: [], navigationController: navigationController)
    }
}

extension MyMoviesViewController: MoviesCollectionViewContract {
    
    func request(nextPage: Int) {
        
    }
    
    func goToDetail(id: Int) {
        let viewController = UIStoryboard.loadViewController() as MovieDetailViewController
        viewController.movieId = id
        viewController.isLocal = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

