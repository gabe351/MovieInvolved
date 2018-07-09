//
//  MoviesCollectionView.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 08/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MoviesCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var movies = [MovieDto]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let movieCell = UINib(nibName: MovieCell.NIB_NAME, bundle: nil)
        self.register(movieCell, forCellWithReuseIdentifier: MovieCell.IDENTIFIER)
        
        self.delegate   = self
        self.dataSource = self
    }
    
    func set(movies: [MovieDto]) {
        self.movies = movies
        self.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: MovieCell.IDENTIFIER, for: indexPath as IndexPath) as! MovieCell
        
        let movieDto = movies[indexPath.row]
        
        cell.configureView(movie: movieDto)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200,
                      height: 210)
    }
}

