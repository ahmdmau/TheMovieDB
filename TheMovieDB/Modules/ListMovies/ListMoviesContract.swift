//
//  ListMoviesContract.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation
import UIKit

protocol ListMoviesViewProtocol: class {
    var presenter: ListMoviesPresenterProtocol? { get set }
    
    //Presenter -> View
    func showListMovies(_ movies: Movies)
    func showError(_ message: String)
}

protocol ListMoviesPresenterProtocol: class {
    var view: ListMoviesViewProtocol? { get set }
    var interactor: ListMoviesInteractorInputProtocol? { get set }
    var router: ListMoviesRouterProtocol? { get set }
    
    //View -> Presenter
    func viewDidLoad(query: String, page: Int)
}

protocol ListMoviesInteractorInputProtocol: class {
    var presenter: ListMoviesInteractorOutputProtocol? { get set }
    
    //Presenter -> Interactor
    func fetchMovies(query: String, page: Int)
}

protocol ListMoviesInteractorOutputProtocol: class {
    
    //Interactor -> Presenter
    func didRetrieveMovies(_ movies: Movies)
    func didRetrieveError(_ message: String)
}

protocol ListMoviesRouterProtocol {
    
    static func createModuleListMovies() -> UIViewController
}
