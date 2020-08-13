//
//  ImageLoader.swift
//  WeatherApp
//
//  Created by Emin Bari on 11.08.2020.
//

import SwiftUI

class ImageLoader {
    var image: UIImage = UIImage()
    
    func load(url urlStr: String ,complited: @escaping (Result<UIImage, Error>) -> ()) {
        
        guard let url = URL(string: urlStr) else {
            return assertionFailure("Url is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            if error == nil {
                DispatchQueue.main.sync() { [weak self] in
                    self?.image = UIImage(data: data!)!
                    complited(.success(self!.image))
                }
            }
        }.resume()
    }
}
