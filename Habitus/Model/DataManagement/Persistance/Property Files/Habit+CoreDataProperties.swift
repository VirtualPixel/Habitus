//
//  Habit+CoreDataProperties.swift
//  Habitus
//
//  Created by Justin Wells on 1/18/23.
//
//

import SwiftUI
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var about: String?
    @NSManaged public var bestCompletionStreak: Int16
    @NSManaged public var currentStreak: Int16
    
    @NSManaged public var blue: Double
    @NSManaged public var green: Double
    @NSManaged public var red: Double

    @NSManaged public var currentCompletionValue: Double
    @NSManaged public var targetValue: Double
    @NSManaged public var icon: String?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var unitType: String?

    @NSManaged public var startDate: Date?
    @NSManaged public var reminderTime: Date?
    @NSManaged public var dateOfLastCompletionStreak: Date?
    @NSManaged public var streakEndDate: Date?

    @NSManaged public var habitProgress: Set<HabitProgress>?
    @NSManaged public var reminders: Set<Reminders>?
    
    public var wrappedAbout: String {
        about ?? "Unknown"
    }
    public var wrappedIcon: String {
        icon ?? "Unknown"
    }
    public var wrappedId: UUID {
        id ?? UUID()
    }
    public var wrappedTitle: String {
        title ?? "Unknown"
    }
    public var wrappedUnitType: String {
        unitType ?? "Unknown"
    }
    public var wrappedStartDate: Date {
        startDate ?? Date()
    }
    public var wrappedReminderTime: Date {
        reminderTime ?? Date()
    }
    public var wrappedDateOfLastCompletionStreak: Date {
        dateOfLastCompletionStreak ?? Date()
    }
    public var wrappedStreakEndDate: Date {
        streakEndDate ?? Date()
    }
    public var wrappedColor: Color {
        Color(red: red, green: green, blue: blue)
    }
    
    public var percentComplete: Double {
        let value = currentCompletionValue / targetValue
        switch value {
        case let x where x > 1.0:
            return 1.0
        default:
            return value
        }
    }
    
    public var isTodayComplete: Bool {
        currentCompletionValue >= targetValue
    }
}

// MARK: Generated accessors for habitProgress
extension Habit {

    @objc(addHabitProgressObject:)
    @NSManaged public func addToHabitProgress(_ value: HabitProgress)

    @objc(removeHabitProgressObject:)
    @NSManaged public func removeFromHabitProgress(_ value: HabitProgress)

    @objc(addHabitProgress:)
    @NSManaged public func addToHabitProgress(_ values: NSSet)

    @objc(removeHabitProgress:)
    @NSManaged public func removeFromHabitProgress(_ values: NSSet)

}

// MARK: Generated accessors for reminders
extension Habit {

    @objc(addRemindersObject:)
    @NSManaged public func addToReminders(_ value: Reminders)

    @objc(removeRemindersObject:)
    @NSManaged public func removeFromReminders(_ value: Reminders)

    @objc(addReminders:)
    @NSManaged public func addToReminders(_ values: NSSet)

    @objc(removeReminders:)
    @NSManaged public func removeFromReminders(_ values: NSSet)

}

extension Habit : Identifiable {

}
