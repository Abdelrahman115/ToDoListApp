//
//  ContentView.swift
//  To Do List
//
//  Created by Abdelrahman on 21/05/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            // signed in
            TabView{
                ToDolistView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Home", systemImage: "house")
                            //.tint(.green)
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }.accentColor(.green)
            //accountView
            
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView:some View{
        TabView{
            ToDolistView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                        //.tint(.green)
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }.accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
