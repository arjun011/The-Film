//
//  PersonDetailsOO.swift
//  The Film
//
//  Created by Arjun on 25/01/22.
//  Copyright © 2022 Arjun C. All rights reserved.
//

import Foundation
class PersonDetailsOO: ObservableObject {
    
    @Published var personDetail:PopularPersonDetailsDataModel?
    @Published var personKnownFor:[MovieDataModel]?
    private let client = PersonDetailsClient()
    

    
 //   @Published var showDetialsWithAnimation:ShowDetailsAnimation = ShowDetailsAnimation()
    
    func getPopularPeopleDetails(userID:Int) {
        self.client.retrivePopularPeopleDetails(userId: userID) { (response) in
            switch response {
            case let .success(personsDetails):
                self.personDetail = personsDetails
                self.personKnownFor = self.personDetail?.combined_credits?.cast
                
            case let .error(error):
                debugPrint("====>\(error)")
            case .offline:
                debugPrint("Offline")
            }
        }
    }
    
    func getTestData() {
        if let path = Bundle.main.path(forResource: "", ofType: "json") {
            do {
                let responseData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let session = try JSONDecoder().decode(PopularPersonDetailsDataModel.self, from: responseData )
                self.personDetail = session
                self.personKnownFor = self.personDetail?.combined_credits?.cast
                debugPrint(self.personDetail?.name ?? "Test")
                
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    
}
