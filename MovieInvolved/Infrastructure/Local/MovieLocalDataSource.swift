//
//  MovieLocalDataSource.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol MovieLocalDataSource {
    
    func findMovieDetailBy(id: Int) -> MovieDetail
    
    func allMovies() -> [Movie]
    
    func save(movie: MovieDetail) -> MovieDetail?
    
    func destroyBy(id: Int)
}
