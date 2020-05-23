//
//  ArticleModel.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/22.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import Foundation

class Article: Decodable {
    let title: String
    let date_published: String
    let date_modified: String
    let id: String
    let url: String
    let external_url: String?
    let author: Author
    let content_html: String
    
    func getPublishDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: date_published) {
            formatter.dateFormat = "MM-dd-yyyy"
            return formatter.string(from: date)
        }
        
        return date_published
    }
}
