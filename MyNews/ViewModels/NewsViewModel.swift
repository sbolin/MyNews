//
//  NewsViewModel.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import Combine
import Foundation

class NewsViewModel: ObservableObject {
    
    @Published var newsArticles: [Article] = []
    let decoder = JSONDecoder()
    
    let url = URL(string:          "https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=\(Secrets.news)")
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchNews()
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    func fetchNews() {
        decoder.dateDecodingStrategy = .formatted(Formatters.apiDateFormatter)
        URLSession.shared.dataTaskPublisher(for: url!)
            .tryMap() { result -> Data in
                guard let httpResponse = result.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: NewsResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        print("data downloaded ok")
                        break
                    case .failure(let error):
                        print("error \(error)")
                        fatalError(error.localizedDescription)
                }
            }, receiveValue: { [weak self] response in
                self?.newsArticles = response.articles
            }
            )
            .store(in: &cancellables)
    }
}
