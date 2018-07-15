//
//  ReleasesPresenter.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ReleasesPresenter: ReleasesPresenterContract {
    
    private let view: ReleasesViewContract
    private let getMovie: GetMovies
    
    init(view: ReleasesViewContract, getMovie: GetMovies) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func loadReleases(page: Int) {
        getMovie.allReleasesBy(page: page) { (callback) in
            callback.onSuccess{ (movies) in
                self.view.show(movies: movies)
            }
            
            callback.onEmptyData {
                self.view.emptyList()
            }
            
            callback.onFailed{ (error) in
                self.view.onError()
            }
        }
    }
}
