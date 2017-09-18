//
//  User+CoreDataProperties.swift
//  
//
//  Created by Kevin Gu on 9/17/17.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var availability: NSSet?

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
