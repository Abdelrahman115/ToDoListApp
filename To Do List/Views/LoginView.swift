//
//  LoginView.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subtitle: "Get your tasks done", angle: 15, background: .blue)
                //Login Form
                Form{
                    TextField("Email Address",text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button{
                        
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Log In")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }.padding()
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
