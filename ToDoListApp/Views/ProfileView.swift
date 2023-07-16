//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        VStack(alignment: .leading) {
            let date = Date(timeIntervalSince1970: user.joined)
                .formatted(date: .abbreviated, time: .shortened)
            ProfileItemView(label: "Name", data: user.name)
            ProfileItemView(label: "Email", data: user.email)
            ProfileItemView(label: "User since", data: date)
        }
        .padding()
        
        Button {
            viewModel.logout()
        } label: {
            Image(systemName: "rectangle.portrait.and.arrow.forward")
            Text("Logout")
        }
        .foregroundColor(.red)
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
