//
//  ReleasesPresenter.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ReleasesViewContract {
    func show(movies: [Movie])
    func emptyList()
    func onError()
    func showLoader()
    func hideLoader()    
}

protocol ReleasesPresenterContract {
    func loadReleases(page: Int)
}
