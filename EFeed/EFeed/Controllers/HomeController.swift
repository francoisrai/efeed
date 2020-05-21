//
//  HomeController.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/22.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    private var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        ArticlesManagerService().fetchArticles { (articles) in
            self.articles = articles
            for article in articles {
                print(article.title)
                print(article.getPublishDate())
                print("***")
            }
        }
    }
}
