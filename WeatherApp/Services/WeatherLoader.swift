//
//  WeatherLoader.swift
//  WeatherApp
//
//  Created by Emin Bari on 10.08.2020.
//

import Foundation

class WeatherLoader{
    
    private var city: String
    private var requestUrl: String
    
    private let apiKey = "dda1c3f2d85b45ac96e74717201008"
    private var baseUrl: String = "https://api.weatherapi.com/v1/current.json"
    
    init(city: String) {
        self.city = city
        self.requestUrl = baseUrl + "?key=" + self.apiKey + "&q=" + city
    }
    
    func fetchData(complited: @escaping (Result<Weather, Error>) -> ()){
        
        guard let url = URL(string: requestUrl) else{
            return assertionFailure("Url is not correct")
        }
        
        URLSession.shared.dataTask(with: url){ (data, respons, error) in
            if error == nil {
                do{
                    let exchData = try JSONDecoder().decode(Weather.self, from: data!)
                    complited(.success(exchData))
                }
                catch{
                    complited(.failure(error))
                }
            }
        }.resume()
    }
}
