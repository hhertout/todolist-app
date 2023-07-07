//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //header
                HeaderView()
                
                //login form
                Form {
                    TextField("Email Adress", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .padding(8)
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled(true)
                        .padding(8)
                    
                    Button {
                        // Attemp to log in
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Log in")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(4)
                        }
                    }
                    .padding()
                }
                // Create account
                VStack {
                    Text("New around here ?")
                    NavigationLink("Create an Account now !", destination: RegisterView())
                        .padding(4)
                }
                .padding(.bottom, 50)
                
                //more
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
