//
//  MyView.swift
//  SwiftUI_stack_practice
//
//  Created by 곽재선 on 2022/05/26.
//

import SwiftUI

struct MyView: View {
    
    var bgColor: Color
    var text: String
    
    
    var body: some View {
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(.top)
            
            Text(text)
                .fontWeight(.black)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(bgColor: Color.red, text: "1번")
    }
}
