//
//  MainWidgetView.swift
//  WidgetExtension
//
//  Created by Emin Bari on 10.08.2020.
//

import WidgetKit
import SwiftUI

struct WidgetView: View {
    var data: DataProvider.Entry
    let mainPadding: CGFloat = 10.0
    let tWidth: CGFloat = 180.0
    let cornerRadius: CGFloat = 10.0
    var rowElementWidth: CGFloat {
        get {
            return tWidth - 2 * mainPadding
        }
    }
    
    var body: some View {
        ZStack {
            let colors = Gradient(colors: [Color.purple, Color.blue])
            let rectangleGradient = LinearGradient(
                gradient: colors,
                startPoint: .leading,
                endPoint: .trailing
            )
            //MARK: - Rectangle with gradient as gradient background of view
            Rectangle().fill(rectangleGradient)
            
            HStack(alignment: .top) {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(Color.black.opacity(0.3))
                        .frame(width: tWidth, alignment: .leading)
                    
                    VStack {
                        MainWeatherView(
                            temperature: data.temperature,
                            weatherDescription: data.description,
                            padding: mainPadding,
                            width: rowElementWidth,
                            image: data.weatherImage)
                        
                        Spacer()
                        
                        WeatherInfoCell(
                            title: "Humidity",
                            width: rowElementWidth,
                            data: String(data.humidity)+"%")

                        WeatherInfoCell(
                            title: "Wind",
                            width: rowElementWidth,
                            data: (String(format:"%.f", data.windSpeed)) + " kph")
                       
                        WeatherInfoCell(
                            title: "Pressure",
                            width: rowElementWidth,
                            data: String((data.pressure)) + " mb")
                        
                        Spacer()
                    }//VStack
                }//ZStack
                Spacer()
                SideInfoView(
                    description: data.description,
                    city: data.city)
            }.padding(mainPadding)
            //HStack
        }
    }
}
