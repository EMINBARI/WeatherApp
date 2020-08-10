//
//  SideInfoView.swift
//  WidgetExtension
//
//  Created by Emin Bari on 10.08.2020.
//

import SwiftUI

struct SideInfoView: View{
    
    let description: String
    let city: String
    
    let imgSize: CGFloat = 16
    let locationImageName: String = "world"
    
    var customDateFormatter = DateFormatter()
    var day: String {
        get{
            return customDateFormatter.weekdaySymbols[Calendar.current.component(.weekday, from: Date())]
        }
    }
    var date: String{
        get{
            customDateFormatter.setLocalizedDateFormatFromTemplate("d MMM yyyy")
            return customDateFormatter.string(from: Date())
        }
    }
    
    
    var body: some View{
        VStack(alignment: .trailing){
            Text(day)
                .bold()
                .font(.title2)
                .foregroundColor(Color.white)
            Text(date)
                .foregroundColor(Color.white)
            Spacer()
            Text(description)
                .font(.callout)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.trailing)
            Spacer()
            HStack{
                Image(locationImageName)
                    .resizable()
                    .frame(width: imgSize, height: imgSize)
                    .colorInvert()
                Text(city)
                    .font(.body)
                    .foregroundColor(Color.white)
            }
        }.padding(.trailing, 5)
    }
}

