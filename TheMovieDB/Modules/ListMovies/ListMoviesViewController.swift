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
    fileprivate var movies = [Results]()
    fileprivate var currentPage = 1
    private let useAutosizingCells = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if useAutosizingCells && tableView.responds(to: #selector(getter: UIView.layoutMargins)) {
            tableView.estimatedRowHeight = 88
            tableView.rowHeight = UITableView.automaticDimension
        }
        tableView.infiniteScrollIndicatorView = CustomInfiniteIndicator(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        tableView.infiniteScrollIndicatorMargin = 40
        tableView.infiniteScrollTriggerOffset = 500
        tableView.addInfiniteScroll { [weak self] (tableView) -> Void in
            self!.presenter?.viewDidLoad(query: "popular", page: self!.currentPage)
        }
            
        tableView.beginInfiniteScroll(true)
        tableView.finishInfiniteScroll()
    }
    
    @IBAction func showCategory(_ sender: Any) {
        showCategoryActionSheet(controller: self)
    }
    
    func showCategoryActionSheet(controller: UIViewController) {
        let alert = UIAlertController()
        alert.addAction(UIAlertAction(title: "Now Playing", style: .default, handler: { (_) in
            self.movies.removeAll()
            self.currentPage = 1
            self.tableView.reloadData()
            self.presenter?.viewDidLoad(query: "now_playing", page: self.currentPage)
        }))

        alert.addAction(UIAlertAction(title: "Upcoming", style: .default, handler: { (_) in
            self.movies.removeAll()
            self.currentPage = 1
            self.tableView.reloadData()
            self.presenter?.viewDidLoad(query: "upcoming", page: self.currentPage)
        }))

        alert.addAction(UIAlertAction(title: "Top Rated", style: .default, handler: { (_) in
            self.movies.removeAll()
            self.currentPage = 1
            self.tableView.reloadData()
            self.presenter?.viewDidLoad(query: "top_rated", page: self.currentPage)
        }))
        
        alert.addAction(UIAlertAction(title: "Popular", style: .default, handler: { (_) in
            self.movies.removeAll()
            self.currentPage = 1
            self.tableView.reloadData()
            self.presenter?.viewDidLoad(query: "popular", page: self.currentPage)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ListMoviesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovies", for: indexPath) as! ListMoviesTableViewCell
        cell.movies = movies[indexPath.row]
        return cell
    }
}

extension ListMoviesViewController: ListMoviesViewProtocol{
    func showListMovies(_ movies: Movies) {
        
        tableView.finishInfiniteScroll()
        
        let moviesCount = self.movies.count
        let (start, end) = (moviesCount, movies.results!.count + moviesCount)
        let indexPaths = (start..<end).map { return IndexPath(row: $0, section: 0) }
        self.movies.append(contentsOf: movies.results!)
        self.currentPage += 1
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: indexPaths, with: .none)
        self.tableView.endUpdates()
    }
    
    func showError(_ message: String){
    }
}
