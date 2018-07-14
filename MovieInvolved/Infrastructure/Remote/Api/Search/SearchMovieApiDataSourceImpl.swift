//
//  SearchMovieApiDataSourceImpl.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 14/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import AlamofireObjectMapper

public class SearchMovieApiDataSourceImpl: SearchMovieApiDataSource {
            
    func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<ReleaseResponse>) -> Void) {
        
        let parameters = buildParameters(page: page, query: query)
        let path       = "search/movie"
        
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
    
    private func buildParameters(apiKey: String = "0bd449b4a197142635ab358c297053e6",
                                 page: Int,
                                 query: String) -> [String:Any] {
        let parameters: [String: Any] = [
            "api_key" : apiKey,
            "page"    : page,
            "query"   : query
        ]
        
        return parameters
    }
}
