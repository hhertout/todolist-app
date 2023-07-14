//
//  ButtonView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 14/07/2023.
//

import SwiftUI

struct StandardButton: View {
    let title: String
    let background: Color
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .bold()
                    .foregroundColor(color)
                    .padding(4)
            }
            Spacer()
        }
        .padding([.top], 10)
    }
}

struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        StandardButton(title: "Title", background: .pink, color: .white) {
            //Action
        }
    }
}
