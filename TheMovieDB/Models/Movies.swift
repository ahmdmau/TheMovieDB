//
//  Movies.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//


import Foundation
import ObjectMapper

struct Movies : Mappable {
    var page : Int?
    var totalResults : Int?
    var totalPages : Int?
    var results : [Results]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        results <- map["results"]
    }

}
