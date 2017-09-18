//
//  Availability+CoreDataProperties.swift
//  
//
//  Created by Kevin Gu on 9/17/17.
//
//

import Foundation
import CoreData


extension Availability {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Availability> {
        return NSFetchRequest<Availability>(entityName: "Availability")
    }

    @NSManaged public var day: String?
    @NSManaged public var breakfast: Bool
    @NSManaged public var lunch: Bool
    @NSManaged public var dinner: Bool
    @NSManaged public var user: User?

}
