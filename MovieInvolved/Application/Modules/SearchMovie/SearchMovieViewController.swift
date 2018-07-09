//
//  SearchMovieViewController.swift
//  MovieInvolved
//
//  Created by Gabriel Rosa on 08/07/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class SearchMovieViewController: BaseViewController {
    
    override class var NAME : String { return "SearchMovie" }
    override class var ID : String { return "SearchMovieID" }
    
    @IBOutlet weak var moviesCollectionView: MoviesCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.topViewController?.title = "Search movies"
        moviesCollectionView.set(movies: createFakeMovies())
    }
    
    
    private func createFakeMovies() -> [MovieDto] {
        
        var movies = [MovieDto]()
        
        movies.append(MovieDto(id: 123,
                               title: "My first movie",
                               posterUrl: "invalid one",
                               releaseDate: "20/10/20018"))
        movies.append(MovieDto(id: 123,
                               title: "My first movie",
                               posterUrl: "invalid one",
                               releaseDate: "20/10/20018"))
        movies.append(MovieDto(id: 123,
                               title: "My first movie",
                               posterUrl: "invalid one",
                               releaseDate: "20/10/20018"))
        movies.append(MovieDto(id: 123,
                               title: "My first movie",
                               posterUrl: "invalid one",
                               releaseDate: "20/10/20018"))
        movies.append(MovieDto(id: 123,
                               title: "My first movie",
                               posterUrl: "invalid one",
                               releaseDate: "20/10/20018"))
        movies.append(MovieDto(id: 123,
                               title: "Vingadores",
                               posterUrl: "http://metropolitanafm.com.br/wp-content/uploads/2018/06/vingadores4.png",
                               releaseDate: "20/10/20018"))
        
        return movies
    }
}
