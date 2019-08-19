//
//  JSON.swift
//  Movies
//
//  Created by kristhian deoliveira on 6/29/19.
//  Copyright © 2019 kristhian deoliveira. All rights reserved.
//

import Foundation



struct Result:Codable {
    var id:Int
    var title:String
    var overview:String
    var posterPath:String?
    var releaseDate:String
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case title = "title"
            case overview = "overview"
            case posterPath = "poster_path"
            case releaseDate = "release_date"
        }
}
struct MoviesList:Codable {
    var results:[Result]
        private enum CodingKeys: String, CodingKey {
            case results
        }
}
