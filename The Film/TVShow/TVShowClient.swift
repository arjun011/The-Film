//
//  TVShowClient.swift
//  The Film
//
//  Created by Arjun on 12/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import Foundation

class TVShowClient {
    
    /// Retrive Latest Tv list
    /// - Parameters:
    ///   - pageIndex: pageIndex
    ///   - response: MovieListDataModel
    func retriveLatestTvList(pageIndex: Int, response: @escaping(ResponseManager<TVShowListDataModel>) -> Void) {
        ClientManager.GET(APIConstant.getLatestTVList + "\(pageIndex)", success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(TVShowListDataModel.self, from: responseData ?? Data())
                response(ResponseManager.success(session))
            } catch {
                print(error.localizedDescription)
                response(ResponseManager.error(error.localizedDescription))
            }
        }) { (error) in
            debugPrint(error?.localizedDescription ?? "Unknow")
            response(ResponseManager.error(error?.localizedDescription ?? "UnKnown"))
        }
    }
    
    
    /// Retrive Top rated Tv list
    /// - Parameters:
    ///   - pageIndex: pageIndex
    ///   - response: MovieListDataModel
    func retriveTopRatedTVList(pageIndex: Int, response: @escaping(ResponseManager<TVShowListDataModel>) -> Void) {
        ClientManager.GET(APIConstant.getTopRatedTVShowList + "\(pageIndex)", success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(TVShowListDataModel.self, from: responseData ?? Data())
                response(ResponseManager.success(session))
            } catch {
                print(error.localizedDescription)
                response(ResponseManager.error(error.localizedDescription))
            }
        }) { (error) in
            debugPrint(error?.localizedDescription ?? "Unknow")
            response(ResponseManager.error(error?.localizedDescription ?? "UnKnown"))
        }
    }
    
    
    /// Retrive Popular Tv list
    /// - Parameters:
    ///   - pageIndex: pageIndex
    ///   - response: MovieListDataModel
    func retrivePopularTVList(pageIndex: Int, response: @escaping(ResponseManager<TVShowListDataModel>) -> Void) {
        ClientManager.GET(APIConstant.getPouplatTVShowList + "\(pageIndex)", success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(TVShowListDataModel.self, from: responseData ?? Data())
                response(ResponseManager.success(session))
            } catch {
                print(error.localizedDescription)
                response(ResponseManager.error(error.localizedDescription))
            }
        }) { (error) in
            debugPrint(error?.localizedDescription ?? "Unknow")
            response(ResponseManager.error(error?.localizedDescription ?? "UnKnown"))
        }
    }
    
    
    /// Retrive Tv ariving Today list
    /// - Parameters:
    ///   - pageIndex: pageIndex
    ///   - response: MovieListDataModel
    func retriveTvArrivingTodayList(pageIndex: Int, response: @escaping(ResponseManager<TVShowListDataModel>) -> Void) {
        ClientManager.GET(APIConstant.getTvArrivingTodayList + "\(pageIndex)", success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(TVShowListDataModel.self, from: responseData ?? Data())
                response(ResponseManager.success(session))
            } catch {
                print(error.localizedDescription)
                response(ResponseManager.error(error.localizedDescription))
            }
        }) { (error) in
            debugPrint(error?.localizedDescription ?? "Unknow")
            response(ResponseManager.error(error?.localizedDescription ?? "UnKnown"))
        }
    }
    
    
    /// Retrive Tv On the Aror list
    /// - Parameters:
    ///   - pageIndex: pageIndex
    ///   - response: MovieListDataModel
    func retriveTvOnAirList(pageIndex: Int, response: @escaping(ResponseManager<TVShowListDataModel>) -> Void) {
        ClientManager.GET(APIConstant.getTvOnTheAirList + "\(pageIndex)", success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(TVShowListDataModel.self, from: responseData ?? Data())
                response(ResponseManager.success(session))
            } catch {
                print(error.localizedDescription)
                response(ResponseManager.error(error.localizedDescription))
            }
        }) { (error) in
            debugPrint(error?.localizedDescription ?? "Unknow")
            response(ResponseManager.error(error?.localizedDescription ?? "UnKnown"))
        }
    }
    
  
}
