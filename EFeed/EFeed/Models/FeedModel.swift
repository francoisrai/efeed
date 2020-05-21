//
//  FeedModel.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/22.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    let version: String
    let title: String
    let home_page_url: String
    let feed_url: String
    let author: Author
    let icon: String
    let favicon: String
    let items: [Article]
}
