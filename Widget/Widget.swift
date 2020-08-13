//
//  Widget.swift
//  Widget
//
//  Created by Emin Bari on 10.08.2020.
//

import WidgetKit
import SwiftUI

@main
struct Config: Widget {
    private let kind: String = "Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: DataProvider()
        ) { data in
            WidgetView(data: data)
        }
        .configurationDisplayName(Text("Weather"))
        .supportedFamilies([.systemMedium])
        .description(Text("Shows weather info"))
    }
}
