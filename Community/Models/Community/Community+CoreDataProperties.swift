//
//  Community+CoreDataProperties.swift
//  
//
//  Created by Kevin Gu on 11/5/17.
//
//

import Foundation
import CoreData

extension Community {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Community> {
        return NSFetchRequest<Community>(entityName: "Community")
    }

    @NSManaged public var details: String?
    @NSManaged public var name: String?
    @NSManaged public var owner: Int64
    @NSManaged public var user: NSSet?

}

// MARK: Generated accessors for user
extension Community {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}
