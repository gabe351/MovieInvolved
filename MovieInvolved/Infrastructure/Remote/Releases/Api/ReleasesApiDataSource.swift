//
//  ReleasesApiDataSource.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 01/05/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ReleasesApiDataSource {
            
    func allReleasesBy(page: Int, year: Int, _ loadCallback: @escaping (BaseCallback<ReleaseResponse>) -> Void)
}
