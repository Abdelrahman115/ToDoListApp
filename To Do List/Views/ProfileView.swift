//
//  ProfileView.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    if let user = viewModel.currentUser{
                        profile(user: user)
                    }else{
                        Text("Loading Profile...")
                    }
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user:user) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125,height: 125)
            .padding()
        //Info: name,email,member since
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(.bottom,5)
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(.bottom,5)
            
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        // sign out
        TLButton(buttonTitle: "Sign Out", background: .red) {
            viewModel.logOut()
        }
        .frame(height: 75)
        .padding()
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
