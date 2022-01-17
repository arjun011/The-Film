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
    @Published var TvShowList:[TVShowDataModel]?
    @Published var popularTVList:[TVShowDataModel]?
    @Published var airingTodayTVList:[TVShowDataModel]?
    @Published var topRatedTVList:[TVShowDataModel]?
    @Published var latestTVList:[TVShowDataModel]?
    @Published var onTVList:[TVShowDataModel]?
    private let homeAPIClient = TVShowClient()
    
    
    /// Retrive Latest TV list
    /// - Parameter pageIndex: page Index
    func retriveLatestTvList() {
        
        homeAPIClient.retriveLatestTvList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.latestTVList?.count ?? 0 > 0 {
                    self.latestTVList?.append(contentsOf: movieList.results)
                }else {
                    self.latestTVList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    
    
    /// Retrive top rated TV list
    /// - Parameter pageIndex: page Index
    func retriveTopRatedTVList() {
        
        homeAPIClient.retriveTopRatedTVList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.topRatedTVList?.count ?? 0 > 0 {
                    self.topRatedTVList?.append(contentsOf: movieList.results)
                }else {
                    self.topRatedTVList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    
    /// Retrive popular TV list
    /// - Parameter pageIndex: page Index
    func retrivePopularTVList() {
        
        homeAPIClient.retrivePopularTVList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.popularTVList?.count ?? 0 > 0 {
                    self.popularTVList?.append(contentsOf: movieList.results)
                }else {
                    self.popularTVList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    
    
    /// Retrive TV arriving today list
    /// - Parameter pageIndex: page Index
    func retriveTvArrivingTodayList() {
        
        homeAPIClient.retriveTvArrivingTodayList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.airingTodayTVList?.count ?? 0 > 0 {
                    self.airingTodayTVList?.append(contentsOf: movieList.results)
                }else {
                    self.airingTodayTVList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    
    /// Retrive TV On Air list
    /// - Parameter pageIndex: page Index
    func retriveTvOnAirList() {
        
        homeAPIClient.retriveTvOnAirList(pageIndex: pageIndex) { (result) in
            
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(movieList):
                
                debugPrint(movieList)
                
                if self.onTVList?.count ?? 0 > 0 {
                    self.onTVList?.append(contentsOf: movieList.results)
                }else {
                    self.onTVList = movieList.results
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
    

    
}
