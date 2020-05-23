//
//  HomeController.swift
//  EFeed
//
//  Created by Francois Rai on 2020/5/22.
//  Copyright © 2020 Francois Rai. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    @IBOutlet weak var indicator:UIActivityIndicatorView?
    // TableView properties
    @IBOutlet weak var tableview: UITableView?
    private let detailSegueIdentifier = "detailSegue"
    
    // Data properties
    private var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initArticles()
    }
    
    // Fetch articles from service
    func initArticles() -> Void {
        ArticlesManagerService().fetchArticles { (articles, error) in
            if error != nil {
                print("THERE IS AN ERROR")
                // Update tableview data
                DispatchQueue.main.async {
                    self.displayInfo(msg: "Something goes wrong, try again")
                }
            } else {
                // Update tableview data
                DispatchQueue.main.async {
                    self.articles = articles
                    self.indicator?.stopAnimating()
                    self.tableview?.reloadData()
                }
            }
        }
    }
    
    func displayInfo(msg: String) -> Void {
        let alert = UIAlertController(title: "Ooops", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCellTableViewCell.identifier, for: indexPath) as! ArticleCellTableViewCell
        
        // Get article for the cell and display title and published date
        let article: Article = articles![indexPath.row]
        cell.setModel(article: article)

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Display the total number of articles in section
        let nbArticles = articles?.count ?? 0
        return "Articles (\(nbArticles))"
    }
    
    // Push the article to the next view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article:Article = articles![indexPath.row]
        // remove the selected state
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: detailSegueIdentifier, sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is DetailController
        {
            let vc = segue.destination as? DetailController
            vc?.article = (sender as! Article)
        }
    }
}
