////
////  EventsDisplay.swift
////  EventsApp
////
////  Created by Student on 2/27/20.
////  Copyright © 2020 Student. All rights reserved.
////
//
//import Foundation
//
//struct Event {
//    var name: String
//    var date: String
//    var venue: String
//
//}
//
///// A collection of fine dining establishments, aka Restaurants
//class Events {
//
//    private static var _shared:Events! // Only visible in this struct
//
//    static var shared:Events {         // To access this anywhere, in the app just write Restaurants.shared
//        if _shared == nil {
//            _shared = Events()
//        }
//        return _shared
//    }
//
//    private var events:[Event] = [
//        Event(name:"Cultural", date: "2020-02-27", venue:"valk Building 111"),
//        Event(name:"Professional", date: "2020-03-27", venue: "Colden Hall 1350")
//    ]
//
//    private init(){                         // We can't make another Restaurants instance, which is a Good Thing: we only want 1 model
//    }
//
//
//    /// Returns restaurant at a given index, nil if non-existant
//    /// Example usage:  Restaurants.shared.getRestaurant(at:5)
//    /// - Parameter index: restaurant to return
//
//    func getEvent(at index:Int)->Event? {
//        if index >= 0 && index < events.count {
//            return events[index]
//        } else {
//            return nil
//        }
//    }
//
//    /// Returns the # of restaurants
//
//    func numEvents() -> Int {
//        return events.count
//    }
//
//    // Alternatively, we could subscript Restaurants, so usage would be Restaurants.shared[5]
//
//    subscript(index:Int) -> Event? {
//        return index >= 0 && index < events.count ? events[index] : nil
//    }
//
//    /// Adds a restaurant to the collection
//    /// Example usage: Restaurants.shared.add(restaurant:Restaurant(name:"A & G", rating:4))
//    /// - Parameter restaurant: restaurant to add
//
//    func add(event:Event){
//        events.append(event)
//    }
//
//    /// Now we can delete restaurants too..
//    /// - Parameter at: <#at description#>
//    func delete(at:Int){
//        events.remove(at: at)
//    }
//
//}
