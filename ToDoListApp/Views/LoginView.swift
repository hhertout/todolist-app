//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //header
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    angle: 15,
                    backgroundColor: .blue,
                    offset: 100
                )
                
                VStack {
                    if !viewModel.errorMessage.isEmpty {
                        Text("Error : " + viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                }
                
                //login form
                Form {
                    TextField("Email Adress", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .padding(8)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                        .padding(8)
                    
                    StandardButton(
                        title: "Login",
                        background: .blue,
                        color: .white
                    ) {
                        viewModel.login()
                    }
                }
                
                VStack {
                    Text("New around here ?")
                    NavigationLink("Create an Account now !", destination: RegisterView())
                        .padding(4)
                }
                .padding(.bottom, 50)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
