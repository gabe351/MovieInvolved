//
//  MyMoviesPresenter.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 16/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MyMoviesPresenter: MyMoviesPresenterContract {
    
    private let view: MyMoviesViewContract
    private let getMovie: GetMovies
    
    init(view: MyMoviesViewContract, getMovie: GetMovies) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func loadMovies() {
        let movies = getMovie.allMovies()
        if movies.isEmpty {
            view.emptyList()
            return
        }
        
        view.show(movies: getMovie.allMovies())
    }
}
