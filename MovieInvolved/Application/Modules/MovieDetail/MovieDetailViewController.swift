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
        var fullGenres = [String]()
        movieImageView.setImageFrom(url: RemoteUtils.buildImageUrl(path: detail.posterPath), placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
        movieTitle.text       = detail.title
        releaseDateLabel.text = "Release: \(detail.releaseDate)"
        movieDescriptionTextView.text = detail.overview
        
        detail.genres.forEach { (genre) in
            fullGenres.append(genre.name)
        }
        
        genreLabel.text = "Genre \(fullGenres)"                
    }
    
    func onError() {
        ToastBuilder(message: "Error on request, check internet", view: self.view)
            .with(position: .center)
            .show()
    }
    
    private func configureView() {
        guard let navigationController = self.navigationController else {
            return
        }
        
        navigationController.isNavigationBarHidden    = false
        navigationController.topViewController?.title = "Movie detail"
    }
}
