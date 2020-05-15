//
//  MovieListModel.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
struct MovieListDataModel: Codable, Identifiable {
    var id: Int?
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var results: [MovieDataModel] = []
}

struct MovieDataModel:Codable , Identifiable{
    var popularity:Float?
    var vote_count:Int?
    var video:Bool?
    var poster_path:String?
    var id:Int?
    var adult:Bool?
    var backdrop_path:String?
    var original_language:String?
    var original_title:String?
    var title:String?
    var vote_average:Float?
    var overview:String?
    var release_date:String?
}
