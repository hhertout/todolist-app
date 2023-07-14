//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // is signed in
            loggedView
        } else {
            VStack {
                LoginView()
            }
        }
    }
    
    @ViewBuilder
    var loggedView: some View {
        TabView {
            ListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
