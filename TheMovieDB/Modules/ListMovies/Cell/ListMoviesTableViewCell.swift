//
//  ListMoviesTableViewCell.swift
//  TheMovieDB
//
//  Created by Ahmad Maulana on 21/02/20.
//  Copyright © 2020 Ahmad Maulana. All rights reserved.
//

import UIKit
import Kingfisher

class ListMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.posterImg.layer.masksToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.setCircularImageView()
    }

    func setCircularImageView() {
        self.posterImg.layer.cornerRadius = CGFloat(15)
    }
    
    var movies: Results!{
        didSet{
            self.configure()
        }
    }
    
    func configure(){
        posterImg.kf.indicatorType = .activity
        if let posterPath = movies.posterPath{
            posterImg.kf.setImage(with: URL(string: "\(Constants.MoviesImageUrl.moviesImageUrl)\(posterPath)"))
        }
        
        
        titleLbl.text = movies.title
        descriptionLbl.text = movies.overview?.truncate(length: 230, trailing: "...")
    }
}
