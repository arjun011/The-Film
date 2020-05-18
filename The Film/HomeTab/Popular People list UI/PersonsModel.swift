//
//  PersonsModel.swift
//  The Film
//
//  Created by Arjun C on 18/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
class PersonsModel: ObservableObject{
    @Published var pageIndex = 1
    @Published var popularPersonsList: PersonsListDataModel?
    private let homeAPIClient = HomeClient()
    
    
    /// Retrive movies list
    /// - Parameter pageIndex: page Index
    func getPopularPersonsList() {
        homeAPIClient.retrivePopularPersonsList(pageIndex: pageIndex) { (result) in
            switch result {
            case .offline:
                debugPrint("Offline")
            case let .success(tvShowist):
                if self.popularPersonsList?.results.count ?? 0 > 0 {
                    self.popularPersonsList?.results.append(contentsOf: tvShowist.results)
                }else {
                    self.popularPersonsList = tvShowist
                }
            case let .error(warning):
                debugPrint(warning)
            }
        }
    }
}
