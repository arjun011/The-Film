//
//  APIManager.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
fileprivate let APIKey = "497d28847a97d410f0d8633bba093d91"
fileprivate let baseUrl = "https://api.themoviedb.org/3/"
internal let imageBaseUrl = "https://image.tmdb.org/t/p/"
struct APIConstant {
    
    /// Movie API
    
    static let getUpcomingMovieList = baseUrl + "movie/upcoming?api_key=\(APIKey)&language=en-US&page="
    
    /// Get Top rated movie list
    static let getTopRatedMovieList = baseUrl + "movie/top_rated?api_key=\(APIKey)&language=en-US&page="
    
    /// Get Popular movie list
    static let getPouplatMovieList = baseUrl + "movie/popular?api_key=\(APIKey)&language=en-US&page="
    
    /// Get Now Playing list
    static let getNowPlayingMovieList = baseUrl + "movie/now_playing?api_key=\(APIKey)&language=en-US&page="
    
    
    /// TVShow
    
    /// Get Latest Tv list
    static let getLatestTVList = baseUrl + "tv/latest?api_key=\(APIKey)&language=en-US&page="
    
    /// Get Top rated Tv list
    static let getTopRatedTVShowList = baseUrl + "tv/top_rated?api_key=\(APIKey)&language=en-US&page="
    
    /// Get Popular Tv list
    static let getPouplatTVShowList = baseUrl + "tv/popular?api_key=\(APIKey)&language=en-US&page="
    
    /// Get Tv arriving Today
    static let getTvArrivingTodayList = baseUrl + "tv/airing_today?api_key=\(APIKey)&language=en-US&page="
    
    /// Get Tv on the Arir
    static let getTvOnTheAirList = baseUrl + "tv/on_the_air?api_key=\(APIKey)&language=en-US&page="
    
    
    
    
    
    /// Get Movie list
   static let getMoviesList = baseUrl + "discover/movie?api_key=\(APIKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page="
   
    // Get TVShow list
    static let getTVShowList = baseUrl + "discover/tv?api_key=\(APIKey)&language=en-US&sort_by=popularity.desc&include_null_first_air_dates=false&page="
    
    
    // Get Popular persons list
    static let getPouplarPersondList = baseUrl + "person/popular?api_key=\(APIKey)&language=en-US&page="
    
    // Get Movie details
    static let getMovieDetails = baseUrl + "movie/%d?api_key=\(APIKey)&language=en&append_to_response=videos,credits,recommendations,reviews"
 
    // Get TVShow Details
    static let getTVShowDetails = baseUrl + "tv/%d?api_key=\(APIKey)&language=en-US&append_to_response=similar,credits,videos"
    
   // Get Popular person details
    static let getPersonDetails = baseUrl + "person/%d?api_key=\(APIKey)&language=en-US&append_to_response=combined_credits"
    

    
    
}

