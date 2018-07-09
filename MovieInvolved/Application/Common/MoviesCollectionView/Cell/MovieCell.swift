//
//  MovieCell.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 08/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    public static let NIB_NAME   = "MovieCell"
    public static let IDENTIFIER = "movieCellIdentifier"
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func configureView(movie: MovieDto) {
        movieTitleLabel.text = movie.title
        movieDateLabel.text  = movie.releaseDate
        movieImageView.setImageFrom(url: movie.posterUrl, placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
    }
    
}
