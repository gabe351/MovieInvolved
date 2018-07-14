//
//  MovieRemoteDataSource.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol MovieRemoteDataSource {
    
    func allReleases()
    
    func searchMovieBy(query: String) -> [Movie]
    
    func moveDetailBy(id: Int) -> MovieDetail
    
}
