//
//  MovieDetailViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 11/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MovieDetailViewController: BaseViewController, MovieDetailViewContract {
    
    override class var NAME : String { return "MovieDetail" }
    override class var ID : String { return "MovieDetailID" }
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var movieDescriptionTextView: UITextView!
    
    var movieId: Int = 0
    var isLocal = false
    
    let loader = LoadingViewController()
    var movieDetail: MovieDetail?
    
    lazy var presenter: MovieDetailPresenterContract = {
       return MovieDetailPresenter(view: self,
                                   getMovie: InjectionUseCase.provideGetMovies())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
        presenter.loadMovieDetail(id: movieId)
    }
    
    func show(detail: MovieDetail) {
        movieImageView.setImageFrom(url: RemoteUtils.buildImageUrl(path: detail.posterPath), placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
        movieTitle.text               = detail.title
        releaseDateLabel.text         = "Release: \(detail.releaseDate)"
        movieDescriptionTextView.text = detail.overview
        genreLabel.text               = "Genre: \(detail.genres.first?.name ?? " ")"
        movieDetail                   = detail
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
        
        if !isLocal {
            let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveMovie))
            self.navigationItem.setRightBarButton(save, animated: true)
        }
                
        navigationController.isNavigationBarHidden    = false
        navigationController.topViewController?.title = "Movie detail"
    }
    
    @objc func saveMovie() {
        guard let detail = movieDetail else {
            return
        }
        
        presenter.save(movie: detail)
    }
    
    func onSaveSuccess() {
        ToastBuilder(message: "Save success", view: self.view)
            .with(position: .center)
            .show()
    }
}
