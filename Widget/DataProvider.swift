//
//  DataProvider.swift
//  WeatherApp
//
//  Created by Emin Bari on 10.08.2020.
//

import WidgetKit
import SwiftUI

struct DataProvider: TimelineProvider {
    
    func timeline(with context: Context, completion: @escaping (Timeline<WidgetDataModel>) -> ()) {
        let date = Date()
        let loader = WeatherLoader(city: "Oslo")
        
        loader.fetchData { result in
            let weatherData: Weather
            if case .success(let fetchedExchData) = result {
                weatherData = fetchedExchData
                let imageLoader = ImageLoader()
                
                imageLoader.load(
                    url: "https:" + weatherData.current.condition.icon) { result in
                    if case .success(let image) = result {
                        
                        //MARK:- Widget's data initializing
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
                            pressure: pressure,
                            weatherImage: image)
                        
                        //MARK:- Widget updating configuration part
                        let updateValue: Int = 1
                        let timePeriod = Calendar.Component.hour
                        let refreshDate = Calendar.current.date(byAdding: timePeriod, value: updateValue, to: date)!
                        let timeLine = Timeline(entries: [data], policy: .after(refreshDate))
                        
                        completion(timeLine)
                    }
                }//load image
            }
        }
    }
    
    //MARK:- Widget overview presentation
    func snapshot(with context: Context, completion: @escaping (WidgetDataModel) -> ()) {
        let date = Date()
        let entryData = WidgetDataModel(
            date: date,
            city: "London",
            temperature: 18,
            description: "Rainy",
            windSpeed: 7,
            humidity: 3,
            pressure: 589,
            weatherImage: UIImage(named: "rainy")!)
        
        completion(entryData)
    }
}
