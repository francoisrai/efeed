//
//  DetailController.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/23.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var articleFooter: UILabel?
    @IBOutlet weak var articleContent: UITextView?
    
    public var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light 
        
        self.title = article.title
        articleFooter?.text = "Article by \(article.author.name ?? "Unknown"), \(article.getPublishDate())"
        articleContent?.attributedText = article.getReadableContent()
    }
    
    @IBAction func shareArticle() -> Void {
        if  article.external_url != nil {
            let linkToShare = NSURL(string: article?.external_url ?? "")
            let objectToShare = [linkToShare]
            let activityVC = UIActivityViewController(activityItems: objectToShare as [Any], applicationActivities: nil)
            
            present(activityVC, animated: true)
        } else {
            MsgService.displayInfo(title: "Sorry", msg: "No link to share", vc: self)
        }
    }
}
