//
//  MoviesEndpoint.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation
import Alamofire

enum MoviesEndpoint: APIConfiguration{
    
    case getListMovies(query: String, page: Int)
        
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
            case .getListMovies:
                return .get
        }
    }
    // MARK: - Parameters
     var parameters: RequestParams {
        switch self {
        
        case .getListMovies( _, let page):
            return .url(["api_key":Constants.APIKey.moviesAPIKey, "page": page])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
            case .getListMovies(let query, _):
                    return query
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.MoviesBaseUrl.moviesBaseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        switch parameters {
            
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
        }
        
        return urlRequest
    }
    
}
