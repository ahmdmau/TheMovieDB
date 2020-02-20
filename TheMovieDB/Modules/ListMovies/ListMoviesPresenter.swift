//
//  ListMoviesPresenter.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation

class ListMoviesPresenter: ListMoviesPresenterProtocol {
    
    weak var view: ListMoviesViewProtocol?
    var interactor: ListMoviesInteractorInputProtocol?
    var router: ListMoviesRouterProtocol?
    
    func viewDidLoad(query: String, page: Int) {
        interactor?.fetchMovies(query: query, page: page)
    }
}

extension ListMoviesPresenter: ListMoviesInteractorOutputProtocol{
    func didRetrieveMovies(_ movies: Movies) {
        view?.showListMovies(movies)
    }
    
    func didRetrieveError(_ message: String) {
        view?.showError(message)
    }
}
