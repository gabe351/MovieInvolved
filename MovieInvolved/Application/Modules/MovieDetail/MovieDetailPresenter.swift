//
//  MovieDetailPresenter.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterContract {
    
    private let view: MovieDetailViewContract
    private let getMovie: GetMovies
    
    init(view: MovieDetailViewContract, getMovie: GetMovies) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func loadMovieDetail(id: Int) {
        view.showLoader()
        getMovie.movieDetail(id: id) { (callback) in
            callback.onSuccess{ (movieDetail) in
                self.view.hideLoader()
                self.view.show(detail: movieDetail)
            }
            
            callback.onFailed{ (error) in
                self.view.hideLoader()
                self.view.onError()
            }
        }
    }
    
    func destroyBy(id: Int) {
        view.destroySuccess()
        getMovie.destroyBy(id: id)
    }
    
    func save(movie: MovieDetail) {
        let _ = getMovie.save(movie: movie)
        view.onSaveSuccess()
    }
}

