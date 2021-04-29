//
//  ImageLoader.swift
//  MyNews
//
//  Created by Scott Bolin on 28-Apr-21.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    private let cache = NSCache<NSString, UIImage>()
    
    
    func load(fromURLString urlString: String) {
        downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
    
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(systemName: "newspaper")
    }
}

struct NewsRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString)}
            .animation(.easeIn(duration: 0.15))
    }
}
