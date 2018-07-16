//
//  MovieDetailContract.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol MovieDetailViewContract {
    func show(detail: MovieDetail)
    func onError()
    func showLoader()
    func hideLoader()
    func onSaveSuccess()
    func destroySuccess()
}

protocol MovieDetailPresenterContract {
    func loadMovieDetail(id: Int)
    func save(movie: MovieDetail)
    func destroyBy(id: Int)
}
