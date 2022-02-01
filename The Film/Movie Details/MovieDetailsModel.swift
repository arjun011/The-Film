//
//  MovieModel.swift
//  The Film
//
//  Created by Arjun C on 11/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation

class MovieDetailsModel: ObservableObject {
    @Published var movieDetails: MovieDetailsDataModel?
    private let client = MovieDetailsClient()
    var movieTime: String {
       // let time = self.getFormattedVideoTime(Duration: (self.movieDetails?.runtime ?? 0))
        return ("hm")
    }
    
    /// Retrive movies list
    /// - Parameter pageIndex: page Index
    func getMoviesDetails(movieID:Int) {
        self.client.retriveMoviesDetails(movieID: movieID) { (result) in
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieDetails):
                debugPrint(movieDetails)
                self.movieDetails = movieDetails
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    
   
}
    
