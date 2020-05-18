//
//  MovieModel.swift
//  The Film
//
//  Created by Arjun C on 11/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation

class MovieModel: ObservableObject {
    @Published var pageIndex = 1
    @Published var movieListArray: MovieListDataModel?
    private let homeAPIClient = HomeClient()
    
    
    /// Retrive movies list
    /// - Parameter pageIndex: page Index
    func getMoviesList() {
        homeAPIClient.retriveMoviesList(pageIndex: pageIndex) { (result) in
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                debugPrint(movieList)
                if self.movieListArray?.results.count ?? 0 > 0 {
                    self.movieListArray?.results.append(contentsOf: movieList.results)
                }else {
                    self.movieListArray = movieList
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
}
