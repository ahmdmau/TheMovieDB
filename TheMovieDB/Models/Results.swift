//
//  Results.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation
import ObjectMapper

struct Results : Mappable {
    var popularity : Double?
    var voteCount : Int?
    var video : Bool?
    var posterPath : String?
    var id : Int?
    var adult : Bool?
    var backdropPath : String?
    var originalLanguage : String?
    var originalTitle : String?
    var genreIds : [Int]?
    var title : String?
    var voteAverage : Int?
    var overview : String?
    var releaseDate : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        popularity <- map["popularity"]
        voteCount <- map["vote_count"]
        video <- map["video"]
        posterPath <- map["poster_path"]
        id <- map["id"]
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIds <- map["genre_ids"]
        title <- map["title"]
        voteAverage <- map["vote_average"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
    }

}
