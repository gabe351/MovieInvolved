//
//  MoviesCollectionViewContract.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol MoviesCollectionViewContract {
    func request(nextPage: Int)
    func goToDetail(id: Int)
}
