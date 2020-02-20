//
//  ListMoviesRouter.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import Foundation
import UIKit

class ListMoviesRouter: ListMoviesRouterProtocol {
    static func createModuleListMovies() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "MoviesNavigation") as! UINavigationController
        guard let listMoviesViewController = navController.topViewController as? ListMoviesViewController else { fatalError("Invalid View Controller") }
        let presenter: ListMoviesPresenterProtocol & ListMoviesInteractorOutputProtocol = ListMoviesPresenter()
        let interactor: ListMoviesInteractorInputProtocol = ListMoviesInteractor()
        let router = ListMoviesRouter()
        
        listMoviesViewController.presenter = presenter
        presenter.view = listMoviesViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return navController
    }
    
    static var storyboard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
