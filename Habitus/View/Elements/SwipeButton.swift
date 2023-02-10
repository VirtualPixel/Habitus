//
//  SwipeButton.swift
//  Habitus
//
//  Created by Justin Wells on 2/9/23.
//

import SwiftUI

struct SwipeButton: View {
    @Environment(\.editMode) var editMode
    @StateObject private var viewModel = ViewModel()
    @FetchRequest(sortDescriptors: []) var habits: FetchedResults<Habit>
    let habit: Habit
    let onDelete: (IndexSet) -> ()
    
    var body: some View {
        VStack {
            //if self.editMode?.wrappedValue == .active {
                Button(action: {
                    withAnimation {
                        if let index = habits.firstIndex(of: habit) {
                            self.onDelete(IndexSet(integer: index))
                        }
                    }
                }) {
                    Image(systemName: "x.circle")
                }
            //}
        }
    }
}
/*
struct SwipeButton_Previews: PreviewProvider {
    static var previews: some View {
        SwipeButton(, habits: .constant(Habit))
    }
}
*/
