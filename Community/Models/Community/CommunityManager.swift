//
//  CommunityData.swift
//  Community
//
//  Created by Kevin Gu on 10/28/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import CoreData
import UIKit

let ALL_COMMUNITIES = [
    [
        "name": "Community 1",
        "details": "Details 1"
    ],
    [
        "name": "Community 2",
        "details": "Details 2"
    ],
    [
        "name": "Community 3",
        "details": "Details 3"
    ]
]

class CommunityManager {
    
    static func createCommunity(name:String, details:String, owner:Int64) {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            let community = NSEntityDescription.insertNewObject(forEntityName: "Community", into: context) as! Community
            community.name = name
            community.details = details
            community.owner = owner
            let user  = getUser(id: owner)
            do {
                community.addToUser(user!)
                try(context.save())
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
            
        }
    }
    
    static func getUser(id: Int64) -> User?{
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
            do {
                fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [id])
                let users =  try context.fetch(fetchRequest) as [User]
                return users[0]
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
        return nil
    }
    
    
    static func getUserCommunities(id: Int64) -> [Community]{
        let user = getUser(id: id)
        return user?.community?.allObjects as! [Community]
    }
    
    static func getAllCommunities() -> [Community]{
        var communities: [Community]!
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            let fetchRequest:NSFetchRequest<Community> = Community.fetchRequest()
            do {
                communities = try(context.fetch(fetchRequest))
            } catch{
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
            return communities
        }
        return []
    }
    
    static func loadCommunities() {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            for allComunity in ALL_COMMUNITIES {
                let community = NSEntityDescription.insertNewObject(forEntityName: "Community", into: context) as! Community
                community.name = allComunity["name"]
                community.details = allComunity["details"]
                community.owner = 1
                do {
                    try(context.save())
                } catch{
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror)")
                }
            }
        }
    }
    
    static func clearData() {
        let userDefaults = UserDefaults()
        userDefaults.removeObject(forKey: USER_ID)
        if let delegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = delegate.persistentContainer.viewContext
            do {
                let entities = ["Community"]
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
    
    static func filterCommunities(communities: [Community], keyword: String) -> [Community] {
        var filteredCommunities:[Community] = []
        if keyword == "" {
            return communities
        }
        for community in communities {
            if community.name?.range(of: keyword) != nil {
                filteredCommunities.append(community)
            }
        }
        return filteredCommunities
    }
}

