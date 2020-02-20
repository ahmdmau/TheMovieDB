//
//  MoviesServices.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import RxSwift

class MoviesServices {
    static func getListMovies(query: String, page: Int) -> Observable<Movies>{
        return Observable<Movies>.create { observer -> Disposable in
            let request = Alamofire
                .request(MoviesEndpoint.getListMovies(query: query, page: page))
                .responseJSON(completionHandler: { response in
                    switch response.result {
                        case .success(let response):
                            let contactResult = Mapper<Movies>().map(JSONObject: response)
                            observer.onNext(contactResult!)
                            observer.onCompleted()
                            
                        case .failure(let error):
                            observer.onError(error)
                    }
                })
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
}
