//
//  GetMovies.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GetMovies {
    
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func findMovieDetailBy(id: Int) -> MovieDetail {
        return repository.findMovieDetailBy(id: id)
    }
    
    func allMovies() -> [Movie] {
        return repository.allMovies()
    }
    
    func save(movie: MovieDetail) -> MovieDetail? {
        return repository.save(movie: movie)
    }
    
    func destroyBy(id: Int) {
        repository.destroyBy(id: id)
    }
    
    func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        repository.allReleasesBy(page: page, loadCallback)
    }
    
    func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        repository.searchMovieBy(query: query, page: page, loadCallback)
    }
    
    func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void) {
        repository.movieDetail(id: id, loadCallback)
    }
}
