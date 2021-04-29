//
//  News.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import Foundation


// MARK: - News
struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
}
