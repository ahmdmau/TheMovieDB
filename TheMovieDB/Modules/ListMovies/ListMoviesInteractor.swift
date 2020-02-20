//
//  ListMoviesInteractor.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation
import RxSwift

class ListMoviesInteractor: ListMoviesInteractorInputProtocol {
    
    var presenter: ListMoviesInteractorOutputProtocol?
    var disposeBag = DisposeBag()
    
    func fetchMovies(query: String, page: Int) {
        MoviesServices.getListMovies(query: query, page: page).subscribe(
            onNext: { movies in
                self.presenter?.didRetrieveMovies(movies)
            }, onError: { error in
                self.presenter?.didRetrieveError(error.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
    
}
