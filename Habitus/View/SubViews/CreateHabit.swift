//
//  CreateHabitView.swift
//  Habitus
//
//  Created by Justin Wells on 1/17/23.
//

import SwiftUI

struct CreateHabit: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        VStack {
                            IconPicker(selectedIcon: $viewModel.selectedIcon, color: $viewModel.selectedColor, isShowing: $viewModel.isIconPickerSelected)
                                .zIndex(viewModel.isIconPickerSelected ? 1 : -2)
                            CustomColorPicker(selectedColor: $viewModel.selectedColor)
                                .zIndex(viewModel.isIconPickerSelected ? -2 : 1)
                        }
                        
                        Spacer()
                        
                        VStack {
                            TextField("Name", text: $viewModel.name)
                                .frame(height: 50)
                                .padding(5)
                            Divider()
                            TextField("Description (Optional)", text: $viewModel.description, axis: .vertical)
                                .lineLimit(6)
                                .frame(height: 160)
                                .padding(5)
                        }
                        .background (
                            RoundedRectangle(cornerRadius: 12)
                                .fill(colorScheme == .dark ?  Color.darkModeButton : .white)
                        )
                        .zIndex(-3)
                    }
                    .padding(.top, 10)
                    
                    VStack {
                        Picker("Goal Amount", selection: $viewModel.unitAmount) {
                            ForEach(viewModel.unit.incrementalValues, id: \.self) { value in
                                Text("\(value.formatted())")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxWidth: .infinity, maxHeight: 130)
                        
                        Divider()
                        
                        HStack {
                            Text("Unit Type")
                                .bold()
                                .font(.system(size: 22))
                                .minimumScaleFactor(0.01)
                            
                            Spacer()
                            
                            Picker("Unit Picker", selection: $viewModel.unit) {
                                ForEach(Unit.allCases, id:\.self) { value in
                                    Text("\(value.displayName)")
                                }
                            }
                            .accentColor(viewModel.selectedColor)
                        }
                        .padding([.leading, .bottom, .trailing])
                        .zIndex(-50)
                    }
                    .formBackground()
                    
                    VStack {
                        Toggle("Remind me at time", isOn: $viewModel.hasNotifications.animation())
                            .font(.system(size: 22))
                            .bold()
                            .padding()
                        
                        if viewModel.hasNotifications {
                            DatePicker("What time?", selection: $viewModel.notificationTime, displayedComponents: .hourAndMinute)
                                .padding()
                        }
                    }
                    .formBackground()
                    
                    Spacer()
                }
            }
            .toolbar() {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(viewModel.selectedColor)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                        saveHabit()
                    } label: {
                        Text("Save")
                            .foregroundColor(viewModel.selectedColor)
                    }
                    .disabled(viewModel.disableButton())
                    .opacity(viewModel.disableButton() ? 0.3: 1.0)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(colorScheme == .dark ? .black : Color.lightModeFormBackground)
        }
    }
    
    func saveHabit() {
        let habit = Habit(context: self.moc)
        
        habit.id = UUID()
        habit.reminderTime = viewModel.notificationTime
        habit.about = viewModel.description
        habit.title = viewModel.name
        habit.icon = viewModel.selectedIcon
        habit.unitType = viewModel.unit.displayName
        habit.targetValue = viewModel.unitAmount
        habit.startDate = Date.now
        
        // color
        habit.red = viewModel.selectedColor.components.r
        habit.green = viewModel.selectedColor.components.g
        habit.blue = viewModel.selectedColor.components.b
        
        try? moc.save()
    }
}

struct CreateHabit_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabit()
    }
}
