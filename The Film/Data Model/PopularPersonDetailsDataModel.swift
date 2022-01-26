//
//  PopularPersonDetailsDataModel.swift
//  The Film
//
//  Created by Arjun C on 19/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
struct PopularPersonDetailsDataModel:Codable {
    var birthday:String?
    var known_for_department:String?
    var id:Int?
    var name:String?
    var gender:Int?
    var biography:String?
    var popularity:Float?
    var place_of_birth:String?
    var profile_path:String?
    var combined_credits:combined_creditsDataModel?
 
}

struct combined_creditsDataModel:Codable {
    var cast:[MovieDataModel]?
}


struct combined_creditsCastDataModel:Codable, Identifiable {
    var id:Int?
    var original_title:String?
    var media_type:String?
    var poster_path:String?
    
}
