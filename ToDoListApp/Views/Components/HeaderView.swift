//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 06/07/2023.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    let offset: CGFloat
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3 , height: 350)
        .offset(y: -offset)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title : "Title",
                   subtitle:  "Subtitle",
                   angle: 15,
                   backgroundColor: .blue,
                   offset: 100
        )
    }
}
