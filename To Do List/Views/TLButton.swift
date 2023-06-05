//
//  TLButton.swift
//  To Do List
//
//  Created by Abdelrahman on 05/06/2023.
//

import SwiftUI

struct TLButton: View {
    let buttonTitle:String
    let background:Color
    let action: () -> Void
    
    var body: some View {
        Button{
            //Action
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(buttonTitle)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(buttonTitle: "Title",background: .blue){
            //Action
        }
    }
}
