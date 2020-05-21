//
//  PopularPeopledetailsClient.swift
//  The Film
//
//  Created by Arjun C on 19/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
class PopularPeopledetailsClient {
    
    
    /// Retrive Popular persons details
    /// - Parameters:
    ///   - userId: selected user id
    ///   - response: PopularPersonDetailsDataModel
    func retrivePopularPeopleDetails(userId: Int, response: @escaping(ResponseManager<PopularPersonDetailsDataModel>) -> Void) {
        let movieDetailsUrl = String(format: APIConstant.getPersonDetails , userId)
        debugPrint(movieDetailsUrl)
        ClientManager.GET(movieDetailsUrl, success: { (responseData, statusCode) in
            do {
                let session = try JSONDecoder().decode(PopularPersonDetailsDataModel.self, from: responseData ?? Data())
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
