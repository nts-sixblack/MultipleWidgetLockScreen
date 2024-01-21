//
//  IntentHandler.swift
//  HandleForCircularWidget
//
//  Created by Thanh Sau on 21/01/2024.
//

import Intents

// TODO: How to create this file
/// File -> New -> Target -> Intent Extension
class IntentHandler: INExtension, CircularWidgetSelectIntentHandling {
    func provideSelectWidgetOptionsCollection(for intent: CircularWidgetSelectIntent, with completion: @escaping (INObjectCollection<CircularIntent>?, Error?) -> Void) {
        let items: [CircularIntent] = [
            .init(
                identifier: "1",
                display: "SoupPay Credit",
                subtitle: "$248.20",
                image: nil
            ),
            .init(
                identifier: "2",
                display: "SoupPay Titanium Credit",
                subtitle: "$602.01",
                image: nil
            ),
            .init(
                identifier: "3",
                display: "Apple Card",
                subtitle: "$17.28",
                image: nil
            ),
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
