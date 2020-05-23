//
//  ArticleCellTableViewCell.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/23.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import UIKit

class ArticleCellTableViewCell: UITableViewCell {
    static let identifier = "articleCell"
    
    private var model: Article?
    func setModel(article: Article) {
        textLabel?.text = article.title
        detailTextLabel?.text = "Published on \(article.getPublishDate())"
    }
}
