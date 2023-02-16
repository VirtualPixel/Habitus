//
//  HabitListView.swift
//  Habitus
//
//  Created by Justin Wells on 2/11/23.
//

import CoreData
import SwiftUI

struct HabitListView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            ProgressBar(progress: viewModel.habit.percentComplete)
                .stroke(viewModel.habit.wrappedColor, lineWidth: 5)
                .offset(x: 0, y: 37.5)
            
            HStack {
                Image("\(viewModel.habit.wrappedIcon)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .blending(color: viewModel.habit.wrappedColor)
                    .frame(width: 60)
                    .padding(.leading, 7)
                VStack {
                    Text(viewModel.habit.wrappedTitle)
                        .bold()
                        .font(.title3)
                    Text(viewModel.habit.wrappedAbout)
                        .font(.callout)
                }
                
                Spacer()
                
                VStack {
                    Text("\(viewModel.habit.currentCompletionValue.formatted()) / \(viewModel.habit.targetValue.formatted())")
                        .bold()
                        .font(.title3)
                        .foregroundColor(viewModel.habit.wrappedColor)
                    Text(viewModel.habit.wrappedUnitType)
                        .bold()
                        //.font(.title3)
                }
                .frame(width: 90)
                .padding(.trailing)
                .transaction { transaction in
                    transaction.animation = nil
                }
            }
        }
        .frame(width: viewModel.deviceSize.width * 0.9, height: 80)
        .background(color())
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            viewModel.habit.currentStreak > 1 ?
            ZStack {
                Image("flames")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .blending(color: Color.streakFire)
                    .frame(width: 35)
                    .offset(y: -3)
                Text("\(viewModel.habit.currentStreak)")
                    .foregroundColor(.black)
                    .bold()
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .frame(width: 20, height: 20)
            }
                .offset(x: viewModel.deviceSize.width * -0.43, y: -30)
            :
            nil
        )
    }//
    
    func color() -> Color {
        colorScheme == .dark ? Color.darkModeButton : Color.lightModeButton.opacity(0.5)
    }
    
    init(habit: Habit) {
        _viewModel = ObservedObject(wrappedValue: ViewModel(habit: habit))
    }
}
/*
struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
    }
}
*/
struct ProgressBar: Shape {
    var progress: Double
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width * CGFloat(progress)
        let height = rect.height
        let startPoint = CGPoint(x: 0, y: height / 2)
        let endPoint = CGPoint(x: width, y: height / 2)
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }
}
