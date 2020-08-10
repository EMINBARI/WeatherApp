//
//  DataProvider.swift
//  WeatherApp
//
//  Created by Emin Bari on 10.08.2020.
//

import Foundation
import WidgetKit

struct DataProvider: TimelineProvider {
    
    func timeline(with context: Context, completion: @escaping (Timeline<WidgetDataModel>) -> ()) {
        let date = Date()
        let loader = WeatherLoader(city: "Sevastopol")
        
        loader.fetchData { result in
            let weatherData: Weather
            if case .success(let fetchedExchData) = result {
                weatherData = fetchedExchData
                print(weatherData.location.country)
                
                let city = weatherData.location.name
                let temperature = weatherData.current.tempC
                let description = weatherData.current.condition.text
                let windSpeed = weatherData.current.windKph
                let humidity = weatherData.current.humidity
                let pressure = weatherData.current.pressureMB
                
                let data = WidgetDataModel(
                    date: date,
                    city: city,
                    temperature: temperature,
                    description: description,
                    windSpeed: windSpeed,
                    humidity: humidity,
                    pressure: pressure)
                
                let refreshDate = Calendar.current.date(byAdding: .hour, value: 1, to: date)!
                let timeLine = Timeline(entries: [data], policy: .after(refreshDate))
                completion(timeLine)
            }
        }
    }
    
    
    func snapshot(with context: Context, completion: @escaping (WidgetDataModel) -> ()) {
        let date = Date()
        let entryData = WidgetDataModel(
            date: date,
            city: "London",
            temperature: 18,
            description: "Rainy",
            windSpeed: 7,
            humidity: 3,
            pressure: 589)
        completion(entryData)
    }
}
