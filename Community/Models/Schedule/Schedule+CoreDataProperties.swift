//
//  Schedule+CoreDataProperties.swift
//  
//
//  Created by Kevin Gu on 11/20/17.
//
//

import Foundation
import CoreData


extension Schedule {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Schedule> {
        return NSFetchRequest<Schedule>(entityName: "Schedule")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var meetupInfo: NSSet?

}

// MARK: Generated accessors for meetupInfo
extension Schedule {

    @objc(addMeetupInfoObject:)
    @NSManaged public func addToMeetupInfo(_ value: MeetupInfo)

    @objc(removeMeetupInfoObject:)
    @NSManaged public func removeFromMeetupInfo(_ value: MeetupInfo)

    @objc(addMeetupInfo:)
    @NSManaged public func addToMeetupInfo(_ values: NSSet)

    @objc(removeMeetupInfo:)
    @NSManaged public func removeFromMeetupInfo(_ values: NSSet)

}
