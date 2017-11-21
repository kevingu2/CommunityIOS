//
//  MeetupInfo+CoreDataProperties.swift
//  
//
//  Created by Kevin Gu on 11/20/17.
//
//

import Foundation
import CoreData


extension MeetupInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeetupInfo> {
        return NSFetchRequest<MeetupInfo>(entityName: "MeetupInfo")
    }

    @NSManaged public var address: String?
    @NSManaged public var food_type: String?
    @NSManaged public var restaraunt_name: String?
    @NSManaged public var time: Int16
    @NSManaged public var date: Schedule?
    @NSManaged public var user: User?

}
