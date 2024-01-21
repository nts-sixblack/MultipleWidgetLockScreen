//
//  IntentHandler.swift
//  HandleForRectangleWidget
//
//  Created by Thanh Sau on 21/01/2024.
//

import Intents

class IntentHandler: INExtension, RectangleWidgetSelectIntentHandling {
    
    func provideSelectWidgetOptionsCollection(for intent: RectangleWidgetSelectIntent, with completion: @escaping (INObjectCollection<RectangleIntent>?, Error?) -> Void) {
        let items: [RectangleIntent] = [
            .init(
                identifier: "4",
                display: "Other Card",
                subtitle: "$123.32",
                image: INImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Stack_Overflow_icon.svg/200px-Stack_Overflow_icon.svg.png")!)!
            ),
        ]
        let collection = INObjectCollection(items: items)
        completion(collection, nil)
    }
}
