//
//  MainWeatherView.swift
//  WidgetExtension
//
//  Created by Emin Bari on 10.08.2020.
//

import SwiftUI

struct MainWeatherView: View {
    let temperature: Double
    let weatherDescription: String
    let padding: CGFloat
    let width: CGFloat
    
    let weatherImageSize: CGFloat = 48
    
    var body: some View {
        HStack{
            Image("sun_cloud")
                .resizable()
                .frame(
                    width: weatherImageSize,
                    height: weatherImageSize)
                .colorInvert()
            Spacer()
            Text("\(String(format: "%.f", temperature))℃")
                .font(.title)
                .foregroundColor(Color.white)
        }
        .frame(width: width)
        .padding(.horizontal, padding)
        .padding(.top, padding)
    }
}
