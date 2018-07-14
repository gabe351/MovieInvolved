//
//  MovieRemoteDataSourceImpl.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MovieRemoteDataSourceImpl: MovieRemoteDataSource {
    
    private static var INSTANCE: MovieRemoteDataSourceImpl?
    
    private let apiDataSource: MovieApiDataSource
    
    private init(apiDataSource: MovieApiDataSource) {
        self.apiDataSource = apiDataSource
    }
    
    public static func getInstance(apiDataSource: MovieApiDataSource) -> MovieRemoteDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = MovieRemoteDataSourceImpl(apiDataSource: apiDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        apiDataSource.searchMovieBy(query: query, page: page, loadCallback)
    }
    
    func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        apiDataSource.allReleasesBy(page: page, loadCallback)
    }
    
    func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void) {
        apiDataSource.movieDetail(id: id, loadCallback)
    }        
}
