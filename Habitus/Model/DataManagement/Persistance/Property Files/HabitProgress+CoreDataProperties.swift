//
//  HabitProgress+CoreDataProperties.swift
//  Habitus
//
//  Created by Justin Wells on 1/18/23.
//
//

import Foundation
import CoreData


extension HabitProgress {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitProgress> {
        return NSFetchRequest<HabitProgress>(entityName: "HabitProgress")
    }

    @NSManaged public var amount: Double
    @NSManaged public var completed: Bool
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var notes: String?
    @NSManaged public var habit: Habit?

    public var wrappedAmount: Double {
        amount
    }
    public var wrappedCompleted: Bool {
        completed
    }
    public var wrappedDate: Date {
        date ?? Date()
    }
    public var wrappedId: UUID {
        id ?? UUID()
    }
    public var wrappedNotes: String {
        notes ?? "Unknown"
    }

}

extension HabitProgress : Identifiable {

}
