//
//  Constant.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation
import Alamofire

struct Constants {
    struct MoviesBaseUrl {
        static let moviesBaseUrl = "https://api.themoviedb.org/3/movie/"
    }
    
    struct MoviesImageUrl {
        static let moviesImageUrl = "https://image.tmdb.org/t/p/original"
    }
    
    struct APIKey {
        static let moviesAPIKey = "45e5d6363dec05a53f59bcc6af7e551f"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    
}

enum ContentType: String {
    case json = "Application/json"
}

enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}
