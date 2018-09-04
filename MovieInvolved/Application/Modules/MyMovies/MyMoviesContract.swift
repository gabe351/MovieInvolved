//
//  MyMoviesContract.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 16/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
protocol MyMoviesViewContract {
    func show(movies: [Movie])
    func emptyList()
}

protocol MyMoviesPresenterContract {
    func loadMovies()
}

