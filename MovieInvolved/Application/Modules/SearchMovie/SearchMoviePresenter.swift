//
//  SearchMoviePresenter.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class SearchMoviePresenter: SearchMoviePresenterContract {
    
    private let view: SearchMovieViewContract
    private let getMovie: GetMovies
    
    init(view: SearchMovieViewContract, getMovie: GetMovies) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func findMovie(page: Int, query: String) {
        view.showLoader()
        getMovie.searchMovieBy(query: query, page: page) { (useCaseCallback) in
            useCaseCallback.onSuccess { movie in
                self.view.hideLoader()
                self.view.show(movies: movie)
            }
            
            useCaseCallback.onEmptyData {
                self.view.hideLoader()
                self.view.emptyList()
            }
            
            useCaseCallback.onFailed{ (error) in
                self.view.hideLoader()
                self.view.onError()
            }
        }
    }
}
