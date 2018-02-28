//
//  AvailabilityData.swift
//  Community
//
//  Created by Kevin Gu on 9/16/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import CoreData
import UIKit

var availabilities: [Availability] = []
let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let kUserId = "user_id"
let kCurrentFirstName = "Kevin"
let kCurrentLastName = "Gu"

extension AvailabilityController {

    func getAvailability(day: String) -> Availability {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            let predicate = NSPredicate(format: "day=%@", argumentArray: [day])
            let fetchRequest: NSFetchRequest<Availability> = Availability.fetchRequest()
            fetchRequest.predicate = predicate
            do {
                return try(context.fetch(fetchRequest)[0])
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
        return Availability()
    }

    func setupData() {
        let userDefaults = UserDefaults()
        let userId = userDefaults.object(forKey: kUserId)
        if userId == nil {
            if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = delegate.persistentContainer.viewContext
                if let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as? User {
                    user.firstName = kCurrentFirstName
                    user.lastName = kCurrentLastName
                    user.id = 1
                    for day in days {
                        if let availability = NSEntityDescription.insertNewObject(forEntityName: "Availability", into: context) as? Availability {
                            availability.day = day
                            availability.user = user
                        }
                    }
                    do {
                        try(context.save())
                    } catch {
                        let nserror = error as NSError
                        fatalError("Unresolved error \(nserror)")
                    }
                    userDefaults.set(user.id, forKey: "user_id")
                }
            } else {
                fatalError("Unresolved error to initialize context")
            }
        }
        //loadData()
    }

    func clearData() {
        let userDefaults = UserDefaults()
        userDefaults.removeObject(forKey: kUserId)
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            do {
                let entities = ["User", "Availability"]
                for entity in entities {
                    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
                    let objects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                    for object in objects! {
                        context.delete(object)
                    }
                    try(context.save())
                }
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }

    func loadData() {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Availability> = Availability.fetchRequest()
            do {
                availabilities = try(context.fetch(fetchRequest))
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }
}
