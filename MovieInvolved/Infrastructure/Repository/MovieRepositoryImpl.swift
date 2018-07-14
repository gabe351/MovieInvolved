//
//  MovieRepositoryImpl.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MovieRepositoryImpl: MovieRepository {
    
    private static var INSTANCE: MovieRepositoryImpl?
    
    private let localDataSource: MovieLocalDataSource
    private let remoteDataSource: MovieRemoteDataSource
    
    private init(localDataSource: MovieLocalDataSource,
                 remoteDataSource: MovieRemoteDataSource) {
        self.localDataSource  = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    public static func getInstance(localDataSource: MovieLocalDataSource,
                                   remoteDataSource: MovieRemoteDataSource) -> MovieRepositoryImpl {
        
        if INSTANCE == nil {
            INSTANCE = MovieRepositoryImpl(localDataSource: localDataSource,
                                           remoteDataSource: remoteDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance(){
        INSTANCE = nil
    }
    
    func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        remoteDataSource.searchMovieBy(query: query, page: page, loadCallback)
    }
    
    func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        remoteDataSource.allReleasesBy(page: page, loadCallback)
    }
    
    func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void) {
        remoteDataSource.movieDetail(id: id, loadCallback)
    }                
}
