//
//  MovieConverter.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MovieConverter {
    
    
    public static func responseToEntity(response: MovieResponse) -> Movie {
        
        return Movie(id: defaultIntIfNil(response.id),
                     title: defaultStringIfNil(response.title),
                     originalTitle: defaultStringIfNil(response.originalTitle),
                     voteAverage: defaultFloatIfNil(response.voteAverage),
                     posterPath: defaultStringIfNil(response.posterPath),
                     releaseDate: defaultStringIfNil(response.releaseDate))
    }
    
    public static func responsesToEntities(responses: [MovieResponse]) -> [Movie] {
        
        var movies = [Movie]()
        
        responses.forEach {
            let entity = responseToEntity(response: $0)
            movies.append(entity)
        }
        
        return movies
    }
    
    public static func detailResponseToEntity(response: MovieDetailResponse) -> MovieDetail {
        
        var foundGenres = [Genre]()
        
        if let genres = response.genres {
            foundGenres = GenreConverter.responsesToEntities(responses: genres)
        }
        
        return MovieDetail(id: defaultIntIfNil(response.id),
                           title: defaultStringIfNil(response.title),
                           originalTitle: defaultStringIfNil(response.originalTitle),
                           voteAverage: defaultFloatIfNil(response.voteAverage),
                           posterPath: defaultStringIfNil(response.posterPath),
                           backdropPath: defaultStringIfNil(response.backdropPath),
                           overview: defaultStringIfNil(response.overview),
                           genres: foundGenres,
                           runtime: defaultIntIfNil(response.runtime),
                           releaseDate: defaultStringIfNil(response.releaseDate))
    }
}
