//
//  HomeClient.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation

class MovieDetailsClient {
    
    /// Retrive Movie details
    /// - Parameters:
    ///   - movieID: Selected Movie id
    ///   - response: MovieDetailsDataModel
    func retriveMoviesDetails(movieID: Int, response: @escaping(ResponseManager<MovieDetailsDataModel>) -> Void) {
        let movieDetailsUrl = String(format: APIConstant.getMovieDetails , movieID)
        debugPrint(movieDetailsUrl)
        ClientManager.GET(movieDetailsUrl, success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(MovieDetailsDataModel.self, from: responseData ?? Data())
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
