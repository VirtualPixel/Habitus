//
//  Reminders+CoreDataProperties.swift
//  Habitus
//
//  Created by Justin Wells on 1/18/23.
//
//

import Foundation
import CoreData


extension Reminders {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminders> {
        return NSFetchRequest<Reminders>(entityName: "Reminders")
    }
    
    @NSManaged public var repeatFrequency: String?
    @NSManaged public var time: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var habit: Habit?

    public var wrappedRepeatFrequency: String {
        repeatFrequency ?? "Unknown"
    }
    public var wrappedTime: Date {
        time ?? Date()
    }
    public var wrappedId: UUID {
        id ?? UUID()
    }


}

extension Reminders : Identifiable {

}
