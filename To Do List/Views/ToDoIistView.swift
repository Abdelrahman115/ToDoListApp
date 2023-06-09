//
//  ToDoItemsView.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDolistView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items:[ToDoListItem]
    private let userId:String
    //@State var userId = ""
    
    init(userId:String){
       self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView {
            VStack{
                    //Spacer()
                List(items) { item in
                    //Text(item.title)
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.deleteItem(id: item.id,userId:userId)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                HStack{
                    Spacer()
                    Button(action: {
                        //Action
                        viewModel.isShowingNewItemView = true
                    }, label: {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 55, height: 50)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    })
                    /*NavigationLink {
                           NewItemView()
                       } label: {
                           Text("+")
                               .font(.system(.largeTitle))
                               .frame(width: 55, height: 50)
                               .foregroundColor(Color.white)
                               .padding(.bottom, 7)
                       }*/
                    .background(Color.green)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                    
                }
                .sheet(isPresented: $viewModel.isShowingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.isShowingNewItemView)
                }
                   
            }
            .navigationTitle("To Do List")
            /*.toolbar {
                Button {
                    //Action
                } label: {
                    Image(systemName: "plus")
                }

            }*/
          
        }
    }
}

struct ToDolistView_Previews: PreviewProvider {
    static var previews: some View {
        ToDolistView(userId: "urNgacByg7RKf8lgJSsuaoNjGBu2")
    }
}
