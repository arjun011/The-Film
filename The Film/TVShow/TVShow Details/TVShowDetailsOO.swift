//
//  TVShowDetailsOO.swift
//  The Film
//
//  Created by Arjun on 27/05/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import Foundation
class TVShowDetailsOO: ObservableObject {
    
    @Published var tvShowDetails:TVShowDetailsDataModel?
    private let client = TVShowDetailsClient()
    
    var trailerID:String {
        get {
            let trailerList = self.tvShowDetails?.videos?.results.first{$0.type ?? "" == "Trailer"}
            return trailerList?.key ?? ""
        }
    }
    
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
