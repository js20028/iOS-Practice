//
//  MyCard.swift.swift
//  SwiftUI_stack_practice
//
//  Created by 곽재선 on 2022/05/23.
//

import SwiftUI

struct MyCard: View {
    
    var icon: String
    var title: String
    var start: String
    var end: String
    var bgColor: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: self.icon)
                .font(.system(size: 50))
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
                Text(self.title)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer().frame(height: 8)
                Text("\(self.start) - \(self.end)")
                    .foregroundColor(.white)
            }
            
        }
        .padding(30)
        .background(bgColor)
        .cornerRadius(20)
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: .green)
    }
}
