//
//  Archive+CoreDataProperties.swift
//  Habitus
//
//  Created by Justin Wells on 2/17/23.
//
//

import Foundation
import CoreData


extension Archive {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Archive> {
        return NSFetchRequest<Archive>(entityName: "Archive")
    }

    @NSManaged public var date: Date?
    @NSManaged public var habitProgress: NSSet?

}

// MARK: Generated accessors for habitProgress
extension Archive {

    @objc(addHabitProgressObject:)
    @NSManaged public func addToHabitProgress(_ value: HabitProgress)

    @objc(removeHabitProgressObject:)
    @NSManaged public func removeFromHabitProgress(_ value: HabitProgress)

    @objc(addHabitProgress:)
    @NSManaged public func addToHabitProgress(_ values: NSSet)

    @objc(removeHabitProgress:)
    @NSManaged public func removeFromHabitProgress(_ values: NSSet)

}

extension Archive : Identifiable {

}
