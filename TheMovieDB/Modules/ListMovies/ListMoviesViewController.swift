//
//  ListMoviesViewController.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import UIKit

class ListMoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListMoviesPresenterProtocol?
    var movies: [Results]?{
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(query: "popular", page: 1)
    }
    
    
    @IBAction func showCategory(_ sender: Any) {
        showCategoryActionSheet(controller: self)
    }
    
    func showCategoryActionSheet(controller: UIViewController) {
        let alert = UIAlertController()
        alert.addAction(UIAlertAction(title: "Now Playing", style: .default, handler: { (_) in
            self.presenter?.viewDidLoad(query: "now_playing", page: 1)
        }))

        alert.addAction(UIAlertAction(title: "Upcoming", style: .default, handler: { (_) in
            self.presenter?.viewDidLoad(query: "upcoming", page: 1)
        }))

        alert.addAction(UIAlertAction(title: "Top Rated", style: .default, handler: { (_) in
            self.presenter?.viewDidLoad(query: "top_rated", page: 1)
        }))
        
        alert.addAction(UIAlertAction(title: "Popular", style: .default, handler: { (_) in
            self.presenter?.viewDidLoad(query: "popular", page: 1)
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
}

extension ListMoviesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovies", for: indexPath) as! ListMoviesTableViewCell
        cell.movies = movies?[indexPath.row]
        return cell
    }
}

extension ListMoviesViewController: ListMoviesViewProtocol{
    func showListMovies(_ movies: Movies) {
        self.movies = movies.results
    }
    
    func showError(_ message: String){
        debugPrint(message)
    }
}
