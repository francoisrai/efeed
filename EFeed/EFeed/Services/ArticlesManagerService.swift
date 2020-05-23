import Foundation


// Client
// Server -> status code / no data
// Serialization -> Decodable


//enum ArticlesManagerServiceError {
//    case badStatusCode
//    case notHttpResponse
//    case invalidUrl
//    ...
//}

final class ArticlesManagerService {
    private let apiUri = "https://daringfireball.net/feeds/json"
    
    func fetchArticles(completionHandler: @escaping ([Article], Error?) -> Void) {
        if let url = URL(string: self.apiUri) {
            // Request the API
            URLSession.shared.dataTask(with: url) { data, response, error in
                // if error print a message
                if let error = error {
                    print("Error while getting data : \(error)")
                    completionHandler([], error)
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    completionHandler([], "Request error" as? Error)
                    return
                }
                
                // if data exist
                if let data = data,
                    let feed = try? JSONDecoder().decode(Feed.self, from: data) {
                    completionHandler(feed.items, nil)
                }
            }.resume()
        }
    }
}
