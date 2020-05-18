//
//  TVShowDetailsModel.swift
//  The Film
//
//  Created by Arjun C on 15/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
class TVShowDetailsModel: ObservableObject {
    @Published var tvShowDetails:TVShowDetailsDataModel?
    private let client = TVShowDetailsClient()
    
    /// Retrive movies list
    /// - Parameter pageIndex: page Index
    func getTvShowDetails(showId:Int) {
        self.client.retriveTVShowDetails(showID: showId) { (result) in
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(showDetails):
                self.tvShowDetails = showDetails
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
}
