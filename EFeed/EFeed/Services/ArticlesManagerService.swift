import Foundation

final class ArticlesManagerService {

  var articles: [Article] = []
  private let apiUri = "https://daringfireball.net/feeds/json"
  
  func fetchArticles(completionHandler: @escaping ([Article]) -> Void) {
    if let url = URL(string: self.apiUri) {
        // Request the API
        URLSession.shared.dataTask(with: url) { data, response, error in
            // if error print a message
            if let error = error {
              print("Error while getting data : \(error)")
              return
            }
            
            // if data exist
            if let data = data,
              let feed = try? JSONDecoder().decode(Feed.self, from: data) {
                completionHandler(feed.items)
            }
        }.resume()
    }
  }
}

