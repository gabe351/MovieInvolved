//
//  MovieLocalDataSourceImpl.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MovieLocalDataSourceImpl: MovieLocalDataSource {
        
    private static var INSTANCE: MovieLocalDataSourceImpl?
    
    public static func getInstance() -> MovieLocalDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = MovieLocalDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func findMovieDetailBy(id: Int) -> MovieDetail {
        return MovieDetail(id: 1,
                           title: "",
                           originalTitle: "",
                           voteAverage: 3.0,
                           posterPath: "",
                           backdropPath: "",
                           overview: "",
                           genres: [Genre](),
                           runtime: 1,
                           releaseDate: "")
    }
    
    func allMovies() -> Movie {
        return Movie(id: 1,
                     title: "",
                     originalTitle: "",
                     voteAverage: 3.9,
                     posterPath: "",
                     releaseDate: "")
    }
    
    func save(movie: Movie) {
        
    }
}
