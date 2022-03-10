//
//  ReviewsOO.swift
//  The Film
//
//  Created by Arjun on 09/02/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import Foundation
class ReviewsOO: ObservableObject {
 
    func getTestData(response: @escaping(reviewsDataModel?) -> Void) {
        if let path = Bundle.main.path(forResource: "MovieDescription", ofType: "json") {
            do {
                let responseData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let session = try JSONDecoder().decode(MovieDetailsDataModel.self, from: responseData )
                response(session.reviews)
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
                print(error)
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
}
