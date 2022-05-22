//
//  ContentView.swift
//  SwiftuiPractice
//
//  Created by 곽재선 on 2022/05/17.
//

import SwiftUI

struct ContentView: View {
    
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    MyView(isActivated: $isActivated)
                    MyView(isActivated: $isActivated)
                    MyView(isActivated: $isActivated)
                }
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                .onTapGesture {
                    withAnimation {
                        self.isActivated.toggle()
                    }
                }
                NavigationLink(destination: MyTextView(isActivated: $isActivated)) {
                    Text("네비게이션")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .padding(20)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding(.top, 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
