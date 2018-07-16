//
//  MovieRepository.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol MovieRepository {
    
    func findMovieDetailBy(id: Int) -> MovieDetail
    
    func allMovies() -> [Movie]
    
    func save(movie: MovieDetail) -> MovieDetail?
    
    func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void)
    
    func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void)
    
    func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void)
}
