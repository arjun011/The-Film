//
//  HomeClient.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation

class HomeClient {
    
    /// Retrive Movie list
    /// - Parameters:
    ///   - pageIndex: pageIndex
    ///   - response: MovieListDataModel
    func retriveMoviesList(pageIndex: Int, response: @escaping(ResponseManager<MovieListDataModel>) -> Void) {
        ClientManager.GET(APIConstant.getMoviesList + "\(pageIndex)", success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(MovieListDataModel.self, from: responseData ?? Data())
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
    
    
    /// Get TvShow List
    /// - Parameters:
    ///   - pageIndex: page Index
    ///   - response: TVShowListDataModel
    func retriveTVShowList(pageIndex: Int, response: @escaping(ResponseManager<TVShowListDataModel>) -> Void) {
        ClientManager.GET(APIConstant.getTVShowList + "\(pageIndex)", success: { (responseData, statusCode) in
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
    
    /// Get Popular persons List
    /// - Parameters:
    ///   - pageIndex: page Index
    ///   - response: TVShowListDataModel
    func retrivePopularPersonsList(pageIndex: Int, response: @escaping(ResponseManager<PersonsListDataModel>) -> Void) {
        ClientManager.GET(APIConstant.getPouplarPersondList + "\(pageIndex)", success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(PersonsListDataModel.self, from: responseData ?? Data())
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
