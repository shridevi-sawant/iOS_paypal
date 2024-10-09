//
//  MovieViewModel.swift
//  PopularMovies
//
//  Created by Shridevi Sawant on 08/10/24.
//

import Foundation
import UIKit

/*
 View Model
 - REference to Model
 - No reference to View
 - Data required by View - Observable
 
 */


class MoviewViewModel: ObservableObject {
    
    private let model = MovieUtility.instance
    
    @Published var movieList : [Movie] = []
    @Published var isDataFetched = false
    
    
    func getPoster(name: String) async -> UIImage? {
        if let url = await model.getMoviePoster(imgName: name) {
            return UIImage(contentsOfFile: url.relativePath)
        }
        
        return nil
    }
    
    func fetchMovies() async {
    
    
        DispatchQueue.main.async {
            self.isDataFetched = false
        }
        
       // try! await Task.sleep(nanoseconds: 4 * 1000_000_000)
        
       let data = await model.getPopularMovies()
        
        DispatchQueue.main.async {
            // published properties to be updated via main thread
            self.movieList = data
            self.isDataFetched = true
        }
        
    }
}
