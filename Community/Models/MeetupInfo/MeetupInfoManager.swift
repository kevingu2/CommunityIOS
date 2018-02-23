//
//  MeetupInfoManager.swift
//  Community
//
//  Created by Kevin Gu on 11/12/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import CoreData
import UIKit

let kMeetUPInfoDay1 = [
    [
        "address": "190 S Murphy Ave, Sunnyvale, CA 94086",
        "restaraunt_name": "Dish Dash",
        "food_type": "Middle Eastern, Mediterranean",
        "time": 12,
        "first_name": "Charles",
        "last_name": "Gu"
    ],
    [
        "address": "595 W El Camino Real Mountain View, CA 94040",
        "restaraunt_name": "Tacos Lujano",
        "food_type": "Food Trucks, Mexican",
        "time": 18,
        "first_name": "Vincent",
        "last_name": "Lee"
    ]
]

let kMeetUPInfoDay2 = [
    [
        "address": "447 E William St San Jose, CA 95112",
        "restaraunt_name": "Spartan Taco Truck",
        "food_type": "Food Trucks, Tacos, Desserts",
        "time": 12,
        "first_name": "Vincent",
        "last_name": "Ta"
    ]
]


class MeetupInfoManager {
    static func getDateWithMeetupInfo () -> [Any]?{
        var dateWithMeetupInfo: [Any]! = []
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            let fetchRequest:NSFetchRequest<Schedule> = Schedule.fetchRequest()
            do {
                let schedules = try(context.fetch(fetchRequest))
                for schedule in schedules {
                    dateWithMeetupInfo.append(schedule)
                    for meetupInfo in schedule.meetupInfo! {
                        dateWithMeetupInfo.append(meetupInfo)
                    }
                }
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
            return dateWithMeetupInfo
        }
        return []
    }
    
    static func load() {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            let today = Date()
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)
            if let schedule = NSEntityDescription.insertNewObject(forEntityName: "Schedule", into: context) as? Schedule {
                schedule.date = tomorrow
                for meetupInfoDic in kMeetUPInfoDay1 {
                    if let meetupInfo = NSEntityDescription.insertNewObject(forEntityName: "MeetupInfo", into: context) as? MeetupInfo {
                        meetupInfo.address = meetupInfoDic["address"] as? String
                        meetupInfo.restarauntName = meetupInfoDic["restaraunt_name"] as? String
                        meetupInfo.foodType = meetupInfoDic["food_type"] as? String
                        if let time = meetupInfoDic["time"] as? Int {
                            meetupInfo.time = Int16(time)
                        }
                        if let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as?
                            User {
                            user.firstName = meetupInfoDic["first_name"] as? String
                            user.lastName = meetupInfoDic["last_name"] as? String
                            meetupInfo.user = user
                            schedule.addToMeetupInfo(meetupInfo)
                        }
                    }
                }
            }
            for meetupInfoDic in kMeetUPInfoDay2 {
                if let schedule2 = NSEntityDescription.insertNewObject(forEntityName: "Schedule", into: context) as? Schedule {
                    let weekAhead = Calendar.current.date(byAdding: .day, value: 7, to: today)
                    schedule2.date = weekAhead
                    if let meetupInfo = NSEntityDescription.insertNewObject(forEntityName: "MeetupInfo", into: context) as? MeetupInfo {
                        meetupInfo.address = meetupInfoDic["address"] as? String
                        meetupInfo.restarauntName = meetupInfoDic["restaraunt_name"] as? String
                        meetupInfo.foodType = meetupInfoDic["food_type"] as? String
                        if let time = meetupInfoDic["time"] as? Int {
                            meetupInfo.time = Int16(time)
                        }
                        if let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as?
                            User {
                            user.firstName = meetupInfoDic["first_name"] as? String
                            user.lastName = meetupInfoDic["last_name"] as? String
                            meetupInfo.user = user
                            schedule2.addToMeetupInfo(meetupInfo)
                        }
                    }
                }
            }
            do {
                try(context.save())
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }

    static func clearData() {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            do {
                let entities = ["Schedule", "MeetupInfo"]
                for entity in entities {
                    let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
                    let objects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                    for object in objects! {
                        context.delete(object)
                    }
                    try(context.save())
                }
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }
}
