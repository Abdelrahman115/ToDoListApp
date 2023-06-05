//
//  LoginView.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subtitle: "Get your tasks done", angle: 15, background: .blue)
                //Login Form
                
                Form{
                    
                    if let message = viewModel.errorMessage{
                        Text(message)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(buttonTitle: "Log In", background: .blue) {
                        //Attempt log in
                        viewModel.login()
                    }
                }
                .offset(y:-50)
                //Create Account
                VStack{
                    Text("Don't have an account?")
                    NavigationLink("Create An Account", destination: RegisterView())
                    
                }
                .padding(.bottom,50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
