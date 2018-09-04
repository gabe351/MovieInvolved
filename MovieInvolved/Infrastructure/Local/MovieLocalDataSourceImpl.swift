//
//  MovieLocalDataSourceImpl.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 15/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

class MovieLocalDataSourceImpl: MovieLocalDataSource {
        
    private static var INSTANCE: MovieLocalDataSourceImpl?
    private let realm: Realm
    
    private init (realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> MovieLocalDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = MovieLocalDataSourceImpl(realm: realm)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func findMovieDetailBy(id: Int) -> MovieDetail {
        let entry = realm.object(ofType: MovieEntry.self, forPrimaryKey: id)
        
        if let foundEntry = entry {
            return MovieConverter.entryToDetail(entry: foundEntry)
        }
        
        return MovieDetail(id: 0,
                           title: "",
                           originalTitle: "",
                           voteAverage: 0.0,
                           posterPath: "",
                           backdropPath: "",
                           overview: "",
                           genres: [Genre](),
                           runtime: 0,
                           releaseDate: "")
    }
    
    func allMovies() -> [Movie] {        
        let entries = realm.objects(MovieEntry.self)
        
        return MovieConverter.entriesToEntities(entries: Array(entries))
    }
    
    func save(movie: MovieDetail) -> MovieDetail? {
        var savedMovie: MovieDetail?
        do {
            
            try realm.write {
                let entry = MovieConverter.detailToEntry(entity: movie)
                realm.add(entry, update: true)
                savedMovie = findMovieDetailBy(id: entry.id)
            }
        } catch {
            return nil
        }
        
        return savedMovie
    }
    
    func destroyBy(id: Int) {
        do {
            try realm.write {
                let objectToDelete = realm.object(ofType: MovieEntry.self, forPrimaryKey: id)
                if let foundEntry = objectToDelete {
                    realm.delete(foundEntry)
                }
            }        
        } catch {
            
        }
    }
}
