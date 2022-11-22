//
//  CreateHabitView.swift
//  Habitus
//
//  Created by Justin Wells on 10/17/22.
//

import SwiftUI

struct CreateHabitView: View, KeyboardReadable {
    let customHabit: Bool
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habit: Habits
    
    @State var newHabit = Habit(title: "", color: .babyBlue, endGoal: 0)
    @State private var message = "Unkown error"
    @State private var showingAlert = false
    @State private var showingUnits = false
    @State private var isKeyboardVisible = false
    
    let frequency = ["Daily", "Weekly", "Monthly"]
    let units = ["count", "step", "meter", "kilometer", "mile", "second", "minute", "hour", "millileter", "ounce", "calorie"]
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Name:")
                        .font(.headline)
                    TextField("Name (Required)", text: $newHabit.title)
                    
                    Text("Description:")
                        .font(.headline)
                    TextField("Description (Optional)", text: $newHabit.description)
                }
                .padding()

                
                VStack(alignment: .leading) {
                    Text("Color:")
                        .font(.headline)
                        .padding()
                    ColorPicker(selectedColor: $newHabit.color)
                    
                    Text("Icon:")
                        .font(.headline)
                        .padding()
                    EmojiTextField(text: $newHabit.icon, placeholder: "Emoji")
                        .padding(.horizontal)
                        .onReceive(newHabit.icon.publisher.collect()) {
                            self.newHabit.icon = String($0.prefix(1))
                        } // limit TextField length to 1
                        
                        
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        PickerTextField(selection: $newHabit.unitOfMeasurement, units: units, color: newHabit.color)
                            .onReceive(newHabit.unitOfMeasurement.publisher.collect()) {
                                self.newHabit.unitOfMeasurement = String($0.prefix(16))
                            } // limit TextField length to 16
                        Spacer()
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Goal:")
                        .font(.headline)
                    
                    HStack {
                        HStack {
                            TextField("Goal", value: $newHabit.endGoal, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                            
                            Text("\(newHabit.correctUnitOfMeasurement)")
                            
                            
                        }
                        .fixedSize()
                        
                        Divider()
                            .padding(.horizontal)
                            .frame(maxWidth: 3)
                            .overlay(newHabit.color)
                        
                        GoalPicker(frequency: $newHabit.frequency, color: newHabit.color)                        
                        
                        Spacer()
                    }
                    
                }
                .padding()
                
                
            }
            // Hide keyboard when you type an icon
            .onChange(of: newHabit.icon) { _ in
                if newHabit.icon.isEmpty { return }
                hideKeyboard()
            }
            
            // If keyboard isn't visible
            if !isKeyboardVisible {
                Text("Preview")
                    .font(.title.bold())
                HabitListView(habits: [newHabit], habit: habit, deleteItems: {_ in })
                
                Button {
                    if newHabit.isValidHabit {
                        habit.items.append(newHabit)
                        dismiss()
                    } else {
                        message = "You must have a valid name, icon, goal, and unit of measurement to continue."
                        showingAlert = true
                    }
                } label: {
                    Image("brain")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(newHabit.color)
                        .padding(10)
                        .overlay(
                            Circle()
                                .stroke(newHabit.color, lineWidth: 6)
                        )
                }
                .alert("Error!", isPresented: $showingAlert) {
                    Button("OK") { }
                } message: {
                    Text(message)
                }
                .frame(width: 60, height: 60)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            if customHabit {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.gray)
                                Image(systemName: "plus")
                                    .foregroundColor(.pastelTurquoise)
                                    .font(.system(size: 20))
                                Text("Custom Habit")
                                    .foregroundColor(.black)
                            } else {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.gray)
                                Text("\(newHabit.icon) \(newHabit.title)")
                                    .foregroundColor(.gray)
                            }
                        }
                })
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    hideKeyboard()
                }
            }
        }
        .onReceive(keyboardPublisher) { newIsKeyboardVisible in
            isKeyboardVisible = newIsKeyboardVisible
        } // Check if keybaord is visible, assign boolean
    }
        
}

struct CreateHabitView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabitView(customHabit: true, habit: Habits())
    }
}
