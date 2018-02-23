//
//  MeetupInfo+CoreDataProperties.swift
//  
//
//  Created by Kevin Gu on 2/6/18.
//
//

import Foundation
import CoreData


extension MeetupInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeetupInfo> {
        return NSFetchRequest<MeetupInfo>(entityName: "MeetupInfo")
    }

    @NSManaged public var address: String?
    @NSManaged public var foodType: String?
    @NSManaged public var restarauntName: String?
    @NSManaged public var time: Int16
    @NSManaged public var date: Schedule?
    @NSManaged public var user: User?

}
