 //
//  User+CoreDataProperties.swift
//  
//
//  Created by Kevin Gu on 11/6/17.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var id: Int64
    @NSManaged public var lastName: String?
    @NSManaged public var availability: NSSet?
    @NSManaged public var community: NSSet?

}

// MARK: Generated accessors for availability
extension User {

    @objc(addAvailabilityObject:)
    @NSManaged public func addToAvailability(_ value: Availability)

    @objc(removeAvailabilityObject:)
    @NSManaged public func removeFromAvailability(_ value: Availability)

    @objc(addAvailability:)
    @NSManaged public func addToAvailability(_ values: NSSet)

    @objc(removeAvailability:)
    @NSManaged public func removeFromAvailability(_ values: NSSet)

}

// MARK: Generated accessors for community
extension User {

    @objc(addCommunityObject:)
    @NSManaged public func addToCommunity(_ value: Community)

    @objc(removeCommunityObject:)
    @NSManaged public func removeFromCommunity(_ value: Community)

    @objc(addCommunity:)
    @NSManaged public func addToCommunity(_ values: NSSet)

    @objc(removeCommunity:)
    @NSManaged public func removeFromCommunity(_ values: NSSet)

}
