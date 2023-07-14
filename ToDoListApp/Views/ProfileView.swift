//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import SwiftUI

struct ProfileView: View {
    @State var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
