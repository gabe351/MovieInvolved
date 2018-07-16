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
    
    public static func entryToEntity(entry: MovieEntry) -> Movie {
        return Movie(id: entry.id,
                     title: entry.title,
                     originalTitle: entry.originalTitle,
                     voteAverage: entry.voteAverage,
                     posterPath: entry.posterPath,
                     releaseDate: entry.releaseDate)
    }
    
    public static func entryToDetail(entry: MovieEntry) -> MovieDetail {
        return MovieDetail(id: entry.id,
                           title: entry.title,
                           originalTitle: entry.originalTitle,
                           voteAverage: entry.voteAverage,
                           posterPath: entry.posterPath,
                           backdropPath: entry.backdropPath,
                           overview: entry.overview,
                           genres: [Genre(id: entry.genreId, name: entry.genre)],
                           runtime: entry.runtime,
                           releaseDate: entry.releaseDate)
    }
    
    public static func entityToEntry(entity: Movie) -> MovieEntry {
        let entry = MovieEntry()
        
        entry.id            = entity.id
        entry.title         = entity.title
        entry.originalTitle = entity.originalTitle
        entry.voteAverage   = entity.voteAverage
        entry.posterPath    = entity.posterPath
        entry.releaseDate   = entity.releaseDate
        
        return entry
    }
    
    public static func detailToEntry(entity: MovieDetail) -> MovieEntry {
        let entry = MovieEntry()
        
        entry.id            = entity.id
        entry.title         = entity.title
        entry.originalTitle = entity.originalTitle
        entry.voteAverage   = entity.voteAverage
        entry.posterPath    = entity.posterPath
        entry.backdropPath  = entity.backdropPath
        entry.overview      = entity.overview
        entry.genre         = entity.genres.first?.name ?? " "
        entry.genreId       = entity.genres.first?.id ?? 0
        entry.runtime       = entity.runtime
        entry.releaseDate   = entity.releaseDate
        
        return entry
    }
    
    public static func entriesToEntities(entries: [MovieEntry]) -> [Movie] {
        var movies = [Movie]()
        
        entries.forEach {
            movies.append(entryToEntity(entry: $0))
        }
        
        return movies
    }        
}
