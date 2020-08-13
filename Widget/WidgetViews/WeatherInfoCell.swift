//
//  WeatherInfoCell.swift
//  WidgetExtension
//
//  Created by Emin Bari on 10.08.2020.
//

import SwiftUI

struct WeatherInfoCell: View {
    let title: String
    let width: CGFloat
    let data: String
    
    let padding: CGFloat = 10
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.white)
                .font(.callout)
            Spacer()
            Text("\(data)").foregroundColor(.white)
        }
        .frame(width: width)
        .padding(.horizontal, padding)
    }
}
