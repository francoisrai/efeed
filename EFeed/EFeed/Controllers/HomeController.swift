//
//  HomeController.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/22.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    // TableView properties
    @IBOutlet weak var tableview: UITableView?
    private let cellIdentifier = "ArticleCell"
    
    // Data properties
    private var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initArticles()
    }
    
    // Fetch articles from service
    func initArticles() -> Void {
        ArticlesManagerService().fetchArticles { (articles) in
            self.articles = articles
            // Update tableview data
            DispatchQueue.main.async {
                self.tableview?.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        // Get article for the cell and display title and published date
        let article:Article = self.articles![indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = "Published on \(article.getPublishDate())"

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Display the total number of articles in section
        let nbArticles = self.articles?.count ?? 0
        return "Articles (\(nbArticles))"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // push the article to the next view
    }
}
