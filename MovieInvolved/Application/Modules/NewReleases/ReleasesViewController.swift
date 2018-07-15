//
//  NewReleasesViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 08/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ReleasesViewController: BaseViewController, ReleasesViewContract {
    
    override class var NAME : String { return "NewReleases" }
    override class var ID : String { return "NewReleasesID" }
    
    @IBOutlet weak var moviesCollectionView: MoviesCollectionView!
    
    let loader: LoadingViewController = LoadingViewController()
    
    lazy var presenter: ReleasesPresenterContract = {
       return ReleasesPresenter(view: self,
                                getMovie: InjectionUseCase.provideGetMovies())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
        moviesCollectionView.contract = self
        presenter.loadReleases(page: 1)
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
        
        self.navigationController?.isNavigationBarHidden    = false
        self.navigationController?.topViewController?.title = "New releases"
                
        moviesCollectionView.setupWith(movies: [], navigationController: navigationController)
    }
}

extension ReleasesViewController: MoviesCollectionViewContract {
    
    func request(nextPage: Int) {
        
    }
    
    func goToDetail(id: Int) {
        let viewController = UIStoryboard.loadViewController() as MovieDetailViewController
        viewController.movieId = id
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
