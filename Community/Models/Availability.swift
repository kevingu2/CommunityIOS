//
//  AvailabilitySource.swift
//  Community
//
//  Created by Kevin Gu on 9/10/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import Foundation

let meals = ["Breakfast", "Lunch", "Dinner"]
let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

enum Day:String {
    case Monday = "Monday"
    case Tuesday = "Tuesday"
    case Wednesday = "Wednesday"
    case Thursday = "Thursday"
    case Friday = "Friday"
    case Saturday = "Saturday"
    case Sunday = "Sunday"
}

class Availibility {
    var day: Day
    public var breakfast = false
    public var lunch = false
    public var dinner = false
    
    init(day:Day){
        self.day = day
    }
}

class AvailibilityManager {
    init(){
        
    }
}
