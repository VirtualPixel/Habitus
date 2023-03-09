//
//  ContentView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject private var viewModel = ViewModel()
    @EnvironmentObject var habitManager: HabitManager
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("", systemImage: "house.fill")
                }
                .tag(0)
            Stats()
                .tabItem {
                    Label("", systemImage: "gauge.high")
                }
                .tag(1)
            Profile()
                .tabItem {
                    Label("", systemImage: "person.fill")
                }
                .tag(2)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            do {
                guard habitManager.isTodayDifferentFromLastOpenDate() else { return }
                let currentDate = Date()
                let startOfDay = Calendar.current.startOfDay(for: currentDate)
                let habits = try moc.fetch(viewModel.fetchRequest)
                
                for habit in habits {
                    archiveHabit(habit: habit)
                    habitManager.resetHabit(habit: habit)
                }
                
                try moc.save()
                UserDefaults.standard.set(startOfDay, forKey: "lastArchiveDate")
            } catch {
                print("There was an error loading a new day: \(error)")
            }
        }
    }
    
    func archiveHabit(habit: Habit) {
        // Get the current date and the start of the day
        let currentDate = Date()
        let startOfDay = Calendar.current.startOfDay(for: currentDate)
        
        // Get the last archive date from UserDefaults or use the current date as the default value
        let lastArchiveDate = UserDefaults.standard.object(forKey: "lastArchiveDate") as? Date ?? startOfDay
        
        // Create any missing archives for the days between the last archive date and the start of the current day
        createMissingArchives(from: lastArchiveDate, to: startOfDay, for: habit)
        
        // Create a new Archive object for the current day and associate it with the current Habit object
        let archive = createArchive(for: startOfDay)
        let habitProgress = createHabitProgress(for: habit, with: archive, at: currentDate)
        associate(habitProgress: habitProgress, with: habit, and: archive)
    }
    
    func createMissingArchives(from startDate: Date, to endDate: Date, for habit: Habit) {
        guard let daysDifference = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day, daysDifference > 1 else {
            return
        }
        
        var archiveDate = startDate
        while archiveDate < endDate {
            let archiveRequest: NSFetchRequest<Archive> = Archive.fetchRequest()
            archiveRequest.predicate = NSPredicate(format: "date == %@", archiveDate as NSDate)
            let existingArchives = try? moc.fetch(archiveRequest)
            
            // If no Archive objects exist for the current day, create a new one
            if existingArchives?.isEmpty ?? true {
                let archive = Archive(context: moc)
                archive.date = archiveDate
                
                let habitProgress = HabitProgress(context: moc)
                habitProgress.amount = 0
                habitProgress.completed = false
                habitProgress.date = archiveDate
                habitProgress.id = UUID()
                habitProgress.notes = ""
                habitProgress.habit = habit
                
                archive.addToHabitProgress(habitProgress)
                habit.addToHabitProgress(habitProgress)
            }
            
            archiveDate = Calendar.current.date(byAdding: .day, value: 1, to: archiveDate)!
        }
    }
    
    func createArchive(for date: Date) -> Archive {
        let archiveRequest: NSFetchRequest<Archive> = Archive.fetchRequest()
        archiveRequest.predicate = NSPredicate(format: "date >= %@ AND date < %@", date as NSDate, Calendar.current.date(byAdding: .day, value: 1, to: date)! as NSDate)
        let existingArchive = try? moc.fetch(archiveRequest).first
        let archive: Archive = existingArchive ?? Archive(context: moc)
        archive.date = date
        return archive
    }
    
    func createHabitProgress(for habit: Habit, with archive: Archive, at date: Date) -> HabitProgress {
        let habitProgress = HabitProgress(context: moc)
        habitProgress.amount = habit.currentCompletionValue
        habitProgress.completed = habit.currentCompletionValue >= habit.targetValue
        habitProgress.date = date
        habitProgress.id = UUID()
        habitProgress.notes = ""
        habitProgress.habit = habit
        habitProgress.archive = archive
        return habitProgress
    }
    
    func associate(habitProgress: HabitProgress, with habit: Habit, and archive: Archive) {
        archive.addToHabitProgress(habitProgress)
        habit.addToHabitProgress(habitProgress)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
