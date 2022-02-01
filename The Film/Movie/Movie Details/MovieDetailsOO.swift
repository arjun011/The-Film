//
//  MovieDetailsOO.swift
//  The Film
//
//  Created by Arjun on 01/02/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import Foundation
class MovieDetailsOO: ObservableObject {
    @Published var movieDetails: MovieDetailsDataModel?
    private let client = MovieDetailsClient()
    
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
    
    
    func getTestData() {
        if let path = Bundle.main.path(forResource: "MovieDescription", ofType: "json") {
            do {
                let responseData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let session = try JSONDecoder().decode(MovieDetailsDataModel.self, from: responseData )
                self.movieDetails = session
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
                print(error)
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
}
