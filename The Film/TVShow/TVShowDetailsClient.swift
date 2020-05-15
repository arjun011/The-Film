
//
//  TVShowDetailClient.swift
//  The Film
//
//  Created by Arjun C on 15/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
class TVShowDetailsClient {
    
    /// Retrive TVShow details
    /// - Parameters:
    ///   - movieID: Selected Movie id
    ///   - response: MovieDetailsDataModel
    func retriveTVShowDetails(showID: Int, response: @escaping(ResponseManager<TVShowDetailsDataModel>) -> Void) {
        let tvShowDetailsUrl = String(format: APIConstant.getTVShowDetails , showID)
        debugPrint(tvShowDetailsUrl)
        ClientManager.GET(tvShowDetailsUrl, success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(TVShowDetailsDataModel.self, from: responseData ?? Data())
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
