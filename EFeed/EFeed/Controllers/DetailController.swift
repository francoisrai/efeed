//
//  DetailController.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/23.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import UIKit
import WebKit

class DetailController: UIViewController {
    @IBOutlet weak var articleFooter: UILabel?
    @IBOutlet weak var articleContent: WKWebView?
    
    public var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = article.title
        articleFooter?.text = "Article by \(article.author.name ?? "Unknown"), \(article.getPublishDate())"
        articleContent?.loadHTMLString(article.content_html, baseURL: nil)
    }
}
