//
//  AddView.swift
//  Habitus
//
//  Created by Justin Wells on 10/16/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(Color(red: 0.56, green: 0.42, blue: 1.00))
                                .font(.system(size: 30))
                            Text("Custom Habit")
                        }
                        
                        Text("Habits")
                            .font(.system(.title2, weight: .semibold))
                            .frame(height: 30)
                        
                        ForEach(habits.defaultItems, id: \.id) { habit in
                            Button {
                                habits.items.append(habit)
                                dismiss()
                            } label: {
                                HStack {
                                    Image(habit.icon)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    Text(habit.title)
                                    
                                    Spacer()
                                    
                                    Text("")
                                }
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
                //Spacer()
            }
        }
        .navigationBarTitle(Text("Add habit"), displayMode: .inline)
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
