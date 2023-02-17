//
//  WelcomeScreen.swift
//  Habitus
//
//  Created by Justin Wells on 1/13/23.
//

import SwiftUI

extension Welcome {
    struct PageOne: View {
        @Binding var currentPage: Int
        let quote: String
        
        var body: some View {
            GeometryReader { geo in
                VStack {
                    Group {
                        Text("Begin the path to positive change.")
                            .font(.title2.bold())
                            .padding(.vertical)
                            .padding(.top, 50)
                            .multilineTextAlignment(.center)
                        Text("\(quote)")
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: geo.size.width * 0.8065)
                    
                    Spacer()
                    
                    Image(decorative: "activities")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width * 0.9)
                    Spacer()
                    
                    Button {
                        withAnimation {
                            currentPage = 1
                        }
                    } label: {
                        Text("Let's go")
                            .pinkButton()
                    }
                    .padding(.bottom, 50)
                }
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
            }
        }
    }
    
    struct PageTwo: View {
        @Binding var currentPage: Int
        @Environment(\.colorScheme) var colorScheme
        
        var body: some View {
            GeometryReader { geo in
                VStack {
                    Group {
                        Text("Reminders")
                            .font(.title2.bold())
                            .padding(.vertical)
                            .padding(.top, 50)
                        Text("Don't miss a day of progress! Studies have shown that when users enable reminders, they're 82% more likely to maintain a habit and achieve their goals.")
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: geo.size.width * 0.8065)
                    
                    Spacer()
                    
                    Image(decorative: colorScheme == .dark ? "darkNotifications" : "notifications")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width * 0.9)
                    Spacer()
                    
                    Button {
                        let center = UNUserNotificationCenter.current()
                        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in }
                    } label: {
                        Text("Enable")
                            .font(.title2)
                            .foregroundColor(colorScheme == .dark ? .white : .black )
                            .padding(.vertical, 8)
                            .padding(.horizontal, 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.notificationsButton, lineWidth: 3)
                            )

                    }
                    Spacer()
                    Button {
                        withAnimation {
                            currentPage = 2
                        }
                    } label: {
                        Text("Next")
                            .pinkButton()
                    }
                    .padding(.bottom, 50)
                }
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
            }
        }
    }
    
    struct PageThree: View {
        @Binding var currentPage: Int
        let formatter = DateFormatter()
        @State private var wakeUp: Date = {
            let calendar = Calendar.current
            var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: Date())
            components.hour = 8
            components.minute = 30
            return calendar.date(from: components) ?? Date()
        }()
        
        var body: some View {
            GeometryReader { geo in
                VStack {
                    Text("What is your typical wake-up time?")
                        .font(.title2.bold())
                        .padding(.vertical)
                        .padding(.top, 50)
                        .multilineTextAlignment(.center)
                        .frame(width: geo.size.width * 0.8065)
                    
                    Spacer()
                    
                    Image(decorative: "wake")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width * 0.9)
                    Spacer()
                    
                    DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                    
                    Spacer()
                    Button {
                        UserDefaults.standard.wakeUpTime = wakeUp
                        
                        withAnimation {
                            currentPage = 3
                            
                        }
                    } label: {
                        Text("Next")
                            .pinkButton()
                    }
                    .padding(.bottom, 50)
                }
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
            }
        }
    }
    
    struct PageFour: View {
        @Environment(\.colorScheme) var colorScheme
        @Binding var currentPage: Int
        @Binding var welcome: Bool
        @State private var name = ""
        @State private var dob = Date.now
        @State private var image: UIImage?
        @State private var showingSheet = false
        @State private var showingActions = false
        @State private var withCamera = false
        
        var body: some View {
            ScrollView {
                VStack {
                    Text("Nice to meet you, could you introduce yourself to me?")
                        .font(.title2.bold())
                        .padding(.vertical)
                        .padding(.top, 50)
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                    
                    Button {
                        showingActions = true
                    } label: {
                        ZStack {
                            if image != nil {
                                Image(uiImage: self.image!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150)
                                        .cornerRadius(50)
                                        .padding(.all, 4)
                                        .frame(width: 100, height: 100)
                                        .background(Color.black.opacity(0.2))
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .padding(8)
                            } else {
                                Image(decorative: "avatar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150)
                            }
                            Image(systemName: "camera.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35)
                                .foregroundColor(.gray)
                                .background(
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(colorScheme == .dark ? .black : .white)
                                )
                                .offset(x: 50, y: 50)
                            
                        }
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("What's your name?")
                            .font(.title2.bold())
                        
                        TextField(
                            "Name",
                            text: $name
                        )
                        .padding(.bottom)
                        Text("What's your date of birth?")
                            .font(.title2.bold())
                    }
                    .padding(.horizontal, 30)
                    .padding(.top)
                    
                    
                    DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date) {
                        Text("Date of Birth")
                    }
                    .labelsHidden()
                    .datePickerStyle(.wheel)
                    
                    Spacer()
                    
                    Button {
                        UserDefaults.standard.dateOfBirth = dob
                        UserDefaults.standard.name = name
                        UserDefaults.standard.lastOpenDate = Date.now
                        UserDefaults.standard.lastArchiveDate = Date.now
                        
                        saveImage()
                        
                        withAnimation {
                            welcome = true
                        }
                    } label: {
                        Text("Begin")
                            .pinkButton()
                            .opacity(name.isEmpty ? 0.5 : 1.0)
                    }
                    .padding(.vertical, 50)
                    .ignoresSafeArea(.keyboard)
                    .disabled(name.isEmpty)
                }
                .sheet(isPresented: $showingSheet) {
                    ImagePicker(sourceType: withCamera == true ? .camera : .photoLibrary, selectedImage: self.$image)
                }
                .actionSheet(isPresented: $showingActions) {
                    ActionSheet(title: Text("Take a photo or select one from your library"), message: nil, buttons: [
                        .default(Text("Take Photo"), action: {
                            self.withCamera = true
                            self.showingSheet = true
                        }),
                        .default(Text("Photo library"), action: {
                            self.withCamera = false
                            self.showingSheet = true
                        }),
                        .cancel()
                    ])
                }
            }
        }
        
        func saveImage() {
            if image != nil {
                let savePath = FileManager.documentsDirectory.appendingPathComponent("profilePicture")
                
                if let jpegData = image!.jpegData(compressionQuality: 0.8) {
                    try? jpegData.write(to: savePath, options: [.atomic, .completeFileProtection])
                }
            }
        }
    }
}

struct Welcome: View {
    @StateObject private var viewModel = ViewModel()
    @Binding var welcome: Bool
    
    var body: some View {
        TabView(selection: $viewModel.currentPage) {
            PageOne(currentPage: $viewModel.currentPage, quote: viewModel.randomQuote())
                .tag(0)
            PageTwo(currentPage: $viewModel.currentPage)
                .tag(1)
            PageThree(currentPage: $viewModel.currentPage)
                .tag(2)
            PageFour(currentPage: $viewModel.currentPage, welcome: $welcome)
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome(welcome: .constant(false))
    }
}


