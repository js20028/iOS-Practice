//
//  MyTabView.swift
//  SwiftUI_stack_practice
//
//  Created by 곽재선 on 2022/05/26.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            MyView(bgColor: Color.red, text: "1번")
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
            
            MyView(bgColor: Color.orange, text: "2번")
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
            
            MyView(bgColor: Color.green, text: "3번")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("3번")
                }
                .tag(2)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
