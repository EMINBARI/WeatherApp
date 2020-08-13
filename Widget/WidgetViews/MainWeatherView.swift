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
    let image: UIImage
    
    let weatherImageSize: CGFloat = 48
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(
                    width: weatherImageSize,
                    height: weatherImageSize)
            Spacer()
            Text("\(String(format: "%.f", temperature))℃")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        .frame(width: width)
    }
}
