//
//  NewsService.swift
//  News
//
//  Created by Dunja Acimovic on 03.06.2021..
//

import UIKit

class NewsService: NSObject {
    
    let apiKey = "150ea451ba96494087d7b02da49a4b4f"
    
    func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        let topStoriesURLString =  "https://newsapi.org/v2/top-headlines?country=gb&apiKey=\(apiKey)"
        guard let url = URL(string: topStoriesURLString) else { return }
        let _ = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result.articles))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func getImage(from url: String?, completion: @escaping (Result<Data?, Error>) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }.resume()
    }
    
    func search(for query: String?, completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let query = query,
              let url = URL(string: "https://newsapi.org/v2/everything?q=\(query)&from=2021-06-25&sortBy=popularity&apiKey=\(apiKey)")
        else { return }
        let _ = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Failure! \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result.articles))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
