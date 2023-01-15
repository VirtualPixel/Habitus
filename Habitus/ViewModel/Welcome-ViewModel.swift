//
//  Welcome-ViewModel.swift
//  Habitus
//
//  Created by Justin Wells on 1/13/23.
//

import Foundation

extension Welcome {
    @MainActor class ViewModel: ObservableObject {
        @Published var currentPage = 3
        let quotes: [String] = [
            "We are what we repeatedly do. Excellence, then, is not an act, but a habit. - Aristotle",
            "Habits are at first cobwebs, then cables. - Spanish Proverb",
            "Motivation is what gets you started. Habit is what keeps you going. - Jim Rohn",
            "Good habits, once established are just as hard to break as are bad habits. - Robert Puller",
            "The only way to change the world is to build new habits of thought. - James Clear",
            "Good habits are as addictive as bad habits, and a lot more rewarding. - Harvey Mackay",
            "The chains of habit are too weak to be felt until they are too strong to be broken. - Samuel Johnson",
            "Successful people are simply those with successful habits. - Brian Tracy",
            "Habits are the compound interest of self-improvement. - James Clear",
            "Habits are the small decisions you make and actions you perform every day. These choices, repeated each day, end up shaping your life. - James Clear"
        ]
        
        func randomQuote() -> String {
            quotes[Int.random(in: 0..<quotes.count)]
        }
    }
}
