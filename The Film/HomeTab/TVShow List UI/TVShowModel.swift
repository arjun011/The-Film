//
//  TVShowModel.swift
//  The Film
//
//  Created by Arjun C on 11/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation

class TVShowModel: ObservableObject {
    @Published var pageIndex = 1
    @Published var TVShowListArray: TVShowListDataModel?
    private let homeAPIClient = HomeClient()
    
    
    /// Retrive movies list
    /// - Parameter pageIndex: page Index
    func getTVShowList() {
        homeAPIClient.retriveTVShowList(pageIndex: pageIndex) { (result) in
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(tvShowist):
                if self.TVShowListArray?.results.count ?? 0 > 0 {
                    self.TVShowListArray?.results.append(contentsOf: tvShowist.results)
                }else {
                    self.TVShowListArray = tvShowist
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
}
