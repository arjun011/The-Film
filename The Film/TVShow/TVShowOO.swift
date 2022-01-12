//
//  TVShowOO.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import Foundation

class TVShowOO: ObservableObject {
    
    @Published var pageIndex = 1
    @Published var movieListArray: MovieListDataModel?
    @Published var nowPlayingMovieList:[MovieDataModel]?
    @Published var popularMovieList:[MovieDataModel]?
    @Published var topRatedMovieList:[MovieDataModel]?
    @Published var upCommingList:[MovieDataModel]?
    private let homeAPIClient = MovieClient()
    
    
    /// Retrive movies list
    /// - Parameter pageIndex: page Index
    func getUpCommingMovie() {
        
        homeAPIClient.retriveUpCommingMovieList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.upCommingList?.count ?? 0 > 0 {
                    self.upCommingList?.append(contentsOf: movieList.results)
                }else {
                    self.upCommingList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    
    
    /// Retrive movies list
    /// - Parameter pageIndex: page Index
    func getTopRatedMovie() {
        
        homeAPIClient.retriveTopRatedMovieList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.topRatedMovieList?.count ?? 0 > 0 {
                    self.topRatedMovieList?.append(contentsOf: movieList.results)
                }else {
                    self.topRatedMovieList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    
    /// Retrive movies list
    /// - Parameter pageIndex: page Index
    func getNowPlayingMovie() {
        
        homeAPIClient.retriveNowPlayingMovieList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.nowPlayingMovieList?.count ?? 0 > 0 {
                    self.nowPlayingMovieList?.append(contentsOf: movieList.results)
                }else {
                    self.nowPlayingMovieList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    
    
    /// Retrive Poplar movies list
    /// - Parameter pageIndex: page Index
    
    func getPopularMovie() {
        
        homeAPIClient.retrivePopularMovieList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.popularMovieList?.count ?? 0 > 0 {
                    self.popularMovieList?.append(contentsOf: movieList.results)
                }else {
                    self.popularMovieList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
}
