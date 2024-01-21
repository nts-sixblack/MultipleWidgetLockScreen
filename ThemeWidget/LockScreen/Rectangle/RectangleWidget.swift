//
//  RectangleWidget.swift
//  ThemeWidgetExtension
//
//  Created by Thanh Sau on 21/01/2024.
//

import Foundation
import WidgetKit
import SwiftUI
import Intents

struct RectangleProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date())
    }

    func getSnapshot(for configuration: RectangleWidgetSelectIntent, in context: Context, completion: @escaping (WidgetEntry) -> ()) {
        let entry = WidgetEntry(date: Date())
        
        completion(entry)
    }

    func getTimeline(for configuration: RectangleWidgetSelectIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [WidgetEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = WidgetEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct RectangleWidgetEntryView : View {
    var entry: RectangleProvider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct RectangleWidget: Widget {
    let kind: String = "RectangleWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: RectangleWidgetSelectIntent.self, provider: RectangleProvider()) { entry in
            RectangleWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Rectangle Widget")
        .description("This is an Rectangle widget.")
        .supportedFamilies([.accessoryRectangular, .accessoryInline])
    }
}

struct RectangleWidget_Previews: PreviewProvider {
    static var previews: some View {
        RectangleWidgetEntryView(entry: WidgetEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
