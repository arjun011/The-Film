//
//  PersonDetailsClient.swift
//  The Film
//
//  Created by Arjun on 25/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import Foundation
class PersonDetailsClient {
    
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
