//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Emin Bari on 10.08.2020.
//

import Foundation
import WidgetKit

struct WidgetDataModel: TimelineEntry {
    let date: Date
    let city: String
    let temperature: Double
    let description: String
    let windSpeed: Double
    let humidity: Int
    let pressure: Int
}

