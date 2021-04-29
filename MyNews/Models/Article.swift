//
//  Article.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import Foundation

// MARK: - Article
struct Article: Decodable, Identifiable {
    // API conformance
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case articleDescription = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
    // accessory parameters
    var id: UUID { return UUID() }
    var imageURL: String {
        return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ?? "https://www.techowns.com/wp-content/uploads/2020/06/Apple-News-icon-1.png"
    }
    var articleIsRead: Bool {
        return false
    }
    
    var articlePublishDate: String {
        return Formatters.dailyDateFormatter.string(from: self.publishedAt)
    }
}

// MARK: - Source
struct Source: Decodable, Identifiable {
    let id: String?
    let name: String
}

extension Article {
    
    static let mockArticle = Article(
        source: Source(id: "cnn", name: "CNN"),
        author: "Adrienne Broaddus and Madeline Holcombe, CNN",
        title: "A juror in the Derek Chauvin trial says every day in the courtroom felt like a funeral - CNN",
        articleDescription: "The images from inside the courtroom still trouble Brandon Mitchell, juror 52 in the trial against Derek Chauvin in the death of George Floyd.",
        url: "https://www.cnn.com/2021/04/28/us/derek-chauvin-george-floyd-trial-juror/index.html",
        urlToImage: "https://cdn.cnn.com/cnnnext/dam/assets/210421093141-derek-chauvin-booking-photo-0421-super-tease.jpg",
        publishedAt: Date(),
        content: nil)
}
