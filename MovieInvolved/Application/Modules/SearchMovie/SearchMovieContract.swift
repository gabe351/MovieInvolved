//
//  SearchMovieContract.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol SearchMovieViewContract {
    func show(movies: [Movie])
    func emptyList()
    func onError()
    func showLoader()
    func hideLoader()
}

protocol SearchMoviePresenterContract {
    func findMovie(query: String)
}
