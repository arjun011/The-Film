//
//  PopularPeopleDetailsModel.swift
//  The Film
//
//  Created by Arjun C on 19/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
class PopularPeopleDetailsModel: ObservableObject {
    @Published var personsDetail:PopularPersonDetailsDataModel?
    private let client = PopularPeopledetailsClient()
    
    func getPopularPeopleDetails(userID:Int) {
        self.client.retrivePopularPeopleDetails(userId: userID) { (response) in
            switch response {
            case let .success(personsDetails):
                self.personsDetail = personsDetails
                debugPrint("=====> \(self.personsDetail)")
                debugPrint("=====> \(self.personsDetail?.name)")
            case let .error(error):
                debugPrint("====>\(error)")
            case .offline:
                debugPrint("Offline")
            }
        }
    }
    
}
