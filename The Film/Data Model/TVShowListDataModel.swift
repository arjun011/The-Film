//
//  MovieListModel.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
struct TVShowListDataModel: Codable, Identifiable {
    var id: Int?
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [TVShowDataModel] = []
}

struct TVShowDataModel:Codable , Identifiable{
    var original_name:String?
    var name:String?
    var popularity:Float?
    var vote_count:Int?
    var first_air_date:String?
    var backdrop_path:String?
    var original_language:String?
    var id:Int?
    var vote_average:Float?
    var overview:String?
    var poster_path:String?
}
