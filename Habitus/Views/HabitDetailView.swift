//
//  HabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/17/22.
//

import SwiftUI

struct HabitDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State var habit: Habit
    @State private var progressBarValue: CGFloat = 0
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    Button {
                        habit.currentValue += Int((Double(habit.endGoal) * 0.25))
                    } label: {
                        Text(habit.icon)
                            .font(.system(size: 84))
                            .padding(.vertical, geo.size.height / 5)
                            .background(
                                //Circle()
                                //    .stroke(habit.color, lineWidth: 6)
                                //    .frame(width: 120)
                                IndicaterCircle()
                                    .foregroundColor(habit.color)
                                    .font(.system(size: 900))
                            )
                    }
                    
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
                .navigationBarItems(
                    leading:
                            Button(action: {
                                dismiss()
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                    Text("\(habit.title)")
                                }
                                .foregroundColor(habit.color)
                            },
                    trailing:
                            Menu {
                                Button("Edit", action: editAction)
                                Button("Delete", role: .destructive, action: deleteHabit)
                            } label: {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(habit.color)
                            })
            }
        } // NavView
    }
    
    func animateProgressBar() {
        withAnimation(.easeInOut(duration: 1.5)) {
            progressBarValue = habit.progressBar
        }
    }
    
    func editAction() {
        // edit current selected Habit
    }
    
    func deleteHabit() {
        // delete current selected Habit
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habit: Habit.example)
        //HabitDetailView()
    }
}
