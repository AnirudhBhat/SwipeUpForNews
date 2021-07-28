import Foundation

class NetworkingService {
    
    let baseUrl =  "https://api.twitter.com/2/users"
    let suffixUrl = "tweets?tweet.fields=created_at"
    let token = "AAAAAAAAAAAAAAAAAAAAAOd9RAEAAAAAV8zxiR3wB013DNIZIDBivB2A8bc%3DSZIcitcV1wVCKEsCBe7cfX1I3hSnzRFYXD9A7XvY8EDtFP4t2v"

    static let dispatchGroup = DispatchGroup()
    
    func getNews() {
        NetworkingService.dispatchGroup.enter()
        self.getTwitterTimelineForUser(id:"259681728") { result  in
            switch result {
            case .success(let twitterData):
                print("\(twitterData) all data.")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        self.getTwitterTimelineForUser(id: "259681728")
        NetworkingService.dispatchGroup.enter()
        self.getTwitterTimelineForUser(id: "3014172800")

        NetworkingService.dispatchGroup.notify(queue: .global()) { [weak self] in
            // Process your responses
        }

    }

    
    func getTwitterTimelineForUser(id: String,completionHandler: @escaping (Result<TwitterData, Error>) -> Void) {
        let request = getTwitterRequestforId(id: id)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                    do {
                        let TwitterData = try JSONDecoder().decode(TwitterData.self, from: data)
                        print(TwitterData)
                        completionHandler(.success(TwitterData))
                    } catch {
                        print(error)
                        completionHandler(.failure(error))

                    }
                } else if let error = error {
                    completionHandler(.failure(error))
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
        NetworkingService.dispatchGroup.leave()
    }
    
    
    func getTwitterRequestforId(id:String) -> URLRequest {
        let urlStr = baseUrl + "/" + id + "/" + suffixUrl
        let url = URL(string: urlStr)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
    
}

