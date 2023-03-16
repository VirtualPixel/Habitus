//
//  Profile.swift
//  Habitus
//
//  Created by Justin Wells on 1/16/23.
//

import SwiftUI

struct Profile: View {
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            viewModel.profilePicture
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150)
                .cornerRadius(50)
                .padding(.all, 4)
                .frame(width: 200, height: 200)
                .background(Color.black.opacity(0.2))
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .padding(8)
            Text("Hello,")
            Text("\(UserDefaults().name)")
                .font(.title2.bold())
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
