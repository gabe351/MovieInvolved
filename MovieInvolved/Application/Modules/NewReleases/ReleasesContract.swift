//
//  ReleasesPresenter.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ReleasesViewContract {
    
    func showReleases()
    
}

protocol ReleasesPresenterContract {
    func loadReleases()
}
