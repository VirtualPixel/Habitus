//
//  HabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/17/22.
//

import SwiftUI

struct HabitDetailView: View {
    //@ObservedObject var habits: Habits
    //var index: Int
    @State var habit = Habit(icon: "🚶🏼‍♂️", title: "Walk", color: .babyBlue, endGoal: 2000, unitOfMeasurement: "cup")
    
    var body: some View {
        //Text(habits.items[index].title)
        GeometryReader { geo in
                VStack {
                    Button("Add 10%") {
                        habit.currentValue += Int((Double(habit.endGoal) * 0.01))
                        //print("Current Value: \(habit.currentValue)")
                        print("Percent complete: \(habit.percentComplete)")
                        print(habit.progressBar)
                        
                        
                    }
                    ZStack {
                        Text(habit.icon)
                    }
                    .padding(.vertical, geo.size.height / 4)
                    
                    ZStack(alignment: .bottom) {
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .frame(width: geo.size.width)
                            .foregroundColor(.darkGray)
                            .rotationEffect(Angle(degrees: -180))
                        
                        Circle()
                            .trim(from: 0.002, to: 0.5)
                            .stroke(Color(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.3)), style: StrokeStyle(lineWidth: 10, dash: [25]))
                            .rotationEffect(Angle(degrees: -180))
                            .padding()
                        
                        Circle()
                            .trim(from: 0, to: habit.progressBar)
                            .stroke(habit.color, lineWidth: 12.0)
                            .frame(width: geo.size.width)
                            .rotationEffect(Angle(degrees: -180))
                    }
                    .fixedSize()
                    .border(.yellow)
                    .edgesIgnoringSafeArea(.all)
                        
                }
                
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //HabitDetailView(habits: Habits(), index: 0)
        HabitDetailView()
    }
}
