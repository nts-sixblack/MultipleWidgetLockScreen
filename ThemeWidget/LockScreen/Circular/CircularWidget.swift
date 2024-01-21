//
//  CircularWidget.swift
//  ThemeWidgetExtension
//
//  Created by Thanh Sau on 21/01/2024.
//

import Foundation
import WidgetKit
import SwiftUI
import Intents

// TODO: Create new lock widget select
/// Cmd + N
/// Sirikit Intent Defination file to create intent
/// config intent file as this file
/// create swift file and coppy source to here
struct CircularProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date())
    }

    func getSnapshot(for configuration: CircularWidgetSelectIntent, in context: Context, completion: @escaping (WidgetEntry) -> ()) {
        let entry = WidgetEntry(date: Date())
        
        completion(entry)
    }

    func getTimeline(for configuration: CircularWidgetSelectIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
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

struct CircularWidgetEntryView : View {
    var entry: CircularProvider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

struct CircularWidget: Widget {
    let kind: String = "CircularWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: CircularWidgetSelectIntent.self, provider: CircularProvider()) { entry in
            CircularWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Circular Widget")
        .description("This is an Circular widget.")
        .supportedFamilies([.accessoryCircular])
    }
}

struct CircularWidget_Previews: PreviewProvider {
    static var previews: some View {
        CircularWidgetEntryView(entry: WidgetEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
