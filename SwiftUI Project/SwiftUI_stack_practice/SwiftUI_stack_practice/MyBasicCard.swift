//
//  MyBasicCard.swift
//  SwiftUI_stack_practice
//
//  Created by 곽재선 on 2022/05/23.
//

import SwiftUI

struct MybasicCard: View {
    var body: some View {
        
        HStack(spacing: 20) {
            
            Image(systemName: "flame.fill")
                .font(.system(size: 50))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
                Text("하하")
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer().frame(height: 8)
                Text("하하")
                    .foregroundColor(.white)
            }
            
        }
        .padding(30)
        .background(Color.purple)
        .cornerRadius(20)
    }
}

struct MybasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MybasicCard()
    }
}
