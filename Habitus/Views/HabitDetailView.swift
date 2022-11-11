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
    @State var habit = Habit(icon: "🚶🏼‍♂️", title: "Walk", color: .babyBlue, endGoal: 2000, currentValue: 0, unitOfMeasurement: "cup")
    @State private var progressBarValue: CGFloat = 0
    
    var body: some View {
        //Text(habits.items[index].title)
        GeometryReader { geo in
                VStack {
                    Button("Add 10%") {
                        habit.currentValue += Int((Double(habit.endGoal) * 0.1))
                    }
                    ZStack {
                        Text(habit.icon)
                    }
                    .padding(.vertical, geo.size.height / 4)
                    
                    ZStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.darkGray)
                                .offset(y: geo.size.height / 3.45)
                            
                            Circle()
                                .trim(from: 0.0, to: 0.5)
                                .frame(width: geo.size.width, height: geo.size.height / 1.72)
                                .foregroundColor(.darkGray)
                                .rotationEffect(Angle(degrees: -180))
                            
                            Circle()
                                .trim(from: 0.002, to: 0.5)
                                .stroke(Color(UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.3)), style: StrokeStyle(lineWidth: 10, dash: [25]))
                                .rotationEffect(Angle(degrees: -180))
                                .padding()
                            
                            Circle()
                                .trim(from: 0, to: progressBarValue)
                                .stroke(habit.color.opacity(2.0), style: StrokeStyle(lineWidth: 12.0, lineCap: .round))
                                .frame(width: geo.size.width)
                                .rotationEffect(Angle(degrees: -180))
                                .onAppear {
                                    animateProgressBar()
                                }
                                                        
                            Text("\(habit.currentValue)")
                                .foregroundColor(.white)
                                .offset(y: -100)
                                .font(.custom("DIN Alternate Bold",
                                              size: 34,
                                              relativeTo: .largeTitle))
                            
                            Text("🏆 Goal: \(habit.endGoal)")
                                .foregroundColor(.white)
                                .offset(y: -50)
                                .font(.custom("DIN Alternate Bold",
                                              size: 23,
                                              relativeTo: .largeTitle))
                            
                            
                            if habit.percentComplete == 100 {
                                Text("You did it! Great job.")
                                    .foregroundColor(.white)
                                    .font(.custom("DIN Alternate Bold",
                                                  size: 23,
                                                  relativeTo: .largeTitle))
                            } else {
                                Text("\(habit.percentComplete > 59 ? "You're almost there!" : "You've got this. Don't give up!")")
                                    .foregroundColor(.white)
                                    .font(.custom("DIN Alternate Bold",
                                                  size: 23,
                                                  relativeTo: .largeTitle))
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        .fixedSize()
                    }
                }
                .onChange(of: habit.currentValue) { _ in 
                    animateProgressBar()
                }
                
        }
        
    }
    
    func animateProgressBar() {
        withAnimation(.easeInOut(duration: 1.5)) {
            progressBarValue = habit.progressBar
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //HabitDetailView(habits: Habits(), index: 0)
        HabitDetailView()
    }
}
