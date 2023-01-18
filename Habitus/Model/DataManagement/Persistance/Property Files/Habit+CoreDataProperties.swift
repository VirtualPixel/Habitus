//
//  Habit+CoreDataProperties.swift
//  Habitus
//
//  Created by Justin Wells on 1/18/23.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var about: String?
    @NSManaged public var bestStreak: Int16
    @NSManaged public var color: String?
    @NSManaged public var currentStreak: Int16

    @NSManaged public var currentValue: Int16
    @NSManaged public var targetValue: Int16
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
    public var wrappedBestStreak: Int16 {
        bestStreak
    }
    public var wrappedColor: String {
        color ?? "Unknown"
    }
    public var wrappedCurrentStreak: Int16 {
        currentStreak
    }
    public var wrappedCurrentValue: Int16 {
        currentValue
    }
    public var wrappedTargetValue: Int16 {
        targetValue
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
