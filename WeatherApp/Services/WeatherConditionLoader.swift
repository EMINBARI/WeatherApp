//
//  WeatherConditionLoader.swift
//  WeatherApp
//
//  Created by Emin Bari on 11.08.2020.
//

import Foundation


class WeatherConditionLoader {
    private var requestUrl: String = "https://www.weatherapi.com/docs/conditions.json"
    
    func fetchData(complited: @escaping (Result<WeatherCondition, Error>) -> ()){
        
        guard let url = URL(string: requestUrl) else {
            return assertionFailure("Url is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            if error == nil {
                do {
                    let exchData = try JSONDecoder().decode(WeatherCondition.self, from: data!)
                    complited(.success(exchData))
                }
                catch {
                    complited(.failure(error))
                }
            }
        }.resume()
    }
}

