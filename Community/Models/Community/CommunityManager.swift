//
//  CommunityData.swift
//  Community
//
//  Created by Kevin Gu on 10/28/17.
//  Copyright © 2017 kgulabs. All rights reserved.
//

import CoreData
import UIKit

let allCommunities = [
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

    static func hasUser(community: Community, userId: Int64) -> Bool {
        let user = getUser(userId: userId)
        if community.user?.count == 0 || user == nil {
            return false
        }
        return community.user!.contains(user!)
    }

    static func getUser(userId: Int64) -> User? {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            do {
                fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [userId])
                let users =  try context.fetch(fetchRequest) as [User]
                return users[0]
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
        return nil
    }

    static func getUserCommunities(userId: Int64) -> [Community] {
        let user = getUser(userId: userId)
        if let communities = user?.community?.allObjects as? [Community] {
            return communities
        }
        return []
    }

    static func getAllCommunities() -> [Community] {
        var communities: [Community]!
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<Community> = Community.fetchRequest()
            do {
                communities = try(context.fetch(fetchRequest))
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
            return communities
        }
        return []
    }

    static func loadCommunities() {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            for allComunity in allCommunities {
                if let community = NSEntityDescription.insertNewObject(forEntityName: "Community", into: context) as? Community {
                    community.name = allComunity["name"]
                    community.details = allComunity["details"]
                    community.owner = 1
                    do {
                        try(context.save())
                    } catch {
                        let nserror = error as NSError
                        fatalError("Unresolved error \(nserror)")
                    }
                }
            }
        }
    }

    static func clearData() {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            do {
                let entities = ["Community"]
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

    static func filterCommunities(communities: [Community], keyword: String) -> [Community] {
        var filteredCommunities: [Community] = []
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

    // MARK: Context Saving

    static func leaveCommunity(community: Community, userId: Int64) throws {
        if !hasUser(community: community, userId: userId) {
            throw MyError.runtimeError("User is not contained in community")
        }
        guard let user  = getUser(userId: userId) else {
            return
        }
        community.removeFromUser(user)
        user.removeFromCommunity(community)
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            do {
                try(context.save())
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }

    static func joinCommunity(community: Community, userId: Int64) throws {
        if hasUser(community: community, userId: userId) {
            throw MyError.runtimeError("User is already in comunity")
        }
        let user = getUser(userId: userId)
        community.addToUser(user!)
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            do {
                try(context.save())
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }

    static func createCommunity(name: String, details: String, owner: Int64) {
        if let delegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = delegate.persistentContainer.viewContext
            if let community = NSEntityDescription.insertNewObject(forEntityName: "Community", into: context) as? Community {
                community.name = name
                community.details = details
                community.owner = owner
                guard let user  = getUser(userId: owner) else {
                    return
                }
                community.addToUser(user)
                user.addToCommunity(community)
                do {
                    try(context.save())
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror)")
                }
            }
        }
    }
}
