//
//  AvailabilityControllerSwift.swift
//  Community
//
//  Created by Kevin Gu on 9/16/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import CoreData
import UIKit

var availabilities:[Availability] = []
let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let USER_ID = "user_id"

extension AvailabilityController {
    
    func setupData() {
        let userDefaults = UserDefaults()
        let userId = userDefaults.object(forKey: USER_ID)
        if userId == nil{
            clearData()
            if let delegate = (UIApplication.shared.delegate as? AppDelegate){
                let context = delegate.persistentContainer.viewContext
                let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
                user.firstName = "Kevin"
                user.lastName = "Gu"
                user.id = 1
                for day in days{
                    let availability = NSEntityDescription.insertNewObject(forEntityName: "Availability", into: context) as! Availability
                    availability.day = day
                    availability.user = user
                }
                do {
                    try(context.save())
                } catch{
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror)")
                }
                userDefaults.set(user.id, forKey: "user_id")
            } else {
                fatalError("Unresolved error to initialize context")
            }
        }
        //loadData()
    }
    
    func clearData() {
        let userDefaults = UserDefaults()
        userDefaults.removeObject(forKey: USER_ID)
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            do {
                let entities = ["User", "Availability"]
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
    
    func loadData() {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            let fetchRequest:NSFetchRequest<Availability> = Availability.fetchRequest()
            do {
                availabilities = try(context.fetch(fetchRequest))
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }
}
