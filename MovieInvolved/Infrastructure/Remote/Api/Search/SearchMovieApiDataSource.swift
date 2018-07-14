//
//  SearchMovieApiDataSource.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol SearchMovieApiDataSource {
    
    func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<ReleaseResponse>) -> Void)
}
