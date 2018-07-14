//
//  ReleasesApiDataSource.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 29/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//


import Foundation
import Alamofire
import AlamofireObjectMapper

public class ReleasesApiDataSourceImpl: ReleasesApiDataSource {
    
    init() {}
    
    func allReleasesBy(page: Int = 1, year: Int = 2019, _ loadCallback: @escaping (BaseCallback<ReleaseResponse>) -> Void) {
        let parameters = buildParameters(page: page, year: year)
        let path       = "discover/movie"
        
        Alamofire.request(RemoteUtils.buildUrl(path: path), method: .get, parameters: parameters).responseObject { (response: DataResponse<ReleaseResponse>) in
            
            switch(response.result) {
                case .success(let response):
                    loadCallback(BaseCallback.success(response))
                    break
                
                case .failure(let error):
                    loadCallback(BaseCallback.failed(error: error))
                    break
            }
        }
    }
    
    //    TODO: Get current date to show releases from this date!
    private func buildParameters(apiKey: String = "0bd449b4a197142635ab358c297053e6",
                                 sortBy: String = "release_date.asc",
                                 page: Int,
                                 year: Int) -> [String:Any] {
        let parameters: [String: Any] = [
            "api_key" : apiKey,
            "sort_by" : sortBy,
            "page"    : page,
            "primary_release_year" : year
        ]
        
        return parameters
    }
}
