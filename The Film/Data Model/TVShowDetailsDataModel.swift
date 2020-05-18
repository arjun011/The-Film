//
//  TVShowDetailsDataModel.swift
//  The Film
//
//  Created by Arjun C on 15/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
struct TVShowDetailsDataModel: Codable {
    var backdrop_path:String?
    var created_by:[created_byDataModel] = []
    var episode_run_time:[Int] = []
    var first_air_date:String?
    var genres:[genresDataModel] = []
    var homepage:String?
    var id:Int?
    var in_production:Bool?
    var languages:[String] = []
    var last_air_date:String?
    var name:String?
    var origin_country:[String] = []
    var original_language:String?
    var original_name:String?
    var overview:String?
    var popularity:Float?
    var poster_path:String?
    var seasons:[seasonsDataModel] = []
    var status:String?
    var type:String?
    var vote_average:Float?
    var vote_count:Int?
    var similar:TVShowListDataModel?
    var credits:creditsDataModel?
    var videos:videoDataModel?
    
}


struct created_byDataModel:Codable {
    var id:Int?
    var credit_id:String?
    var name:String?
    var gender:Int?
    var profile_path:String?
}

struct seasonsDataModel:Codable {
    var air_date:String?
    var episode_count:Int?
    var id:Int?
    var name:String?
    var overview:String?
    var poster_path:String?
    var season_number:Int?
}
