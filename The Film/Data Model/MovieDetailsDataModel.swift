//
//  MovieDetailsDataModel.swift
//  The Film
//
//  Created by Arjun C on 11/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation

struct MovieDetailsDataModel:Codable,Identifiable{
    var adult: Bool?
    var backdrop_path:String?
    var budget:Float?
    var genres:[genresDataModel] = []
    var homepage:String?
    var id:Int?
    var imdb_id:String?
    var original_language:String?
    var original_title:String?
    var overview:String?
    var popularity:Float?
    var poster_path:String?
    var release_date:String?
    var revenue:Float?
    var runtime:Int?
    var spoken_languages:[spokenlanguagesDataModel] = []
    var status:String?
    var tagline:String?
    var title:String?
    var vote_average:Float?
    var vote_count:Int?
    var videos:videoDataModel?
    var credits:creditsDataModel?
    var recommendations:MovieListDataModel?
    var reviews:reviewsDataModel?
}


struct genresDataModel:Codable,Identifiable {
    var id:Int?
    var name:String?
    
}

struct spokenlanguagesDataModel:Codable {
    var iso_639_1:String?
    var name:String?
}

struct videoDataModel:Codable {
    var results:[videoResultDataModel] = []
}

struct videoResultDataModel:Codable, Identifiable {
    var id:String?
    var iso_639_1:String?
    var iso_3166_1:String?
    var key:String?
    var name:String?
    var site:String?
    var size:Int?
    var type:String?
}

struct creditsDataModel:Codable,Identifiable {
    var cast: [castDataModel] = []
    let id = UUID()
}

struct castDataModel:Codable,Identifiable {
    var cast_id:Int?
    var character:String?
    var credit_id:String?
    var gender:Int?
    var id:Int?
    var name:String?
    var order:Int?
    var profile_path:String?
}


//----


// MARK: - Welcome
struct reviewsDataModel: Codable {
    let page: Int?
    let results: [ReviewResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ReviewResult: Codable {
    let author: String?
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username: String?
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}



