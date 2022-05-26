//
//  MyList.swift.swift
//  SwiftUI_stack_practice
//
//  Created by 곽재선 on 2022/05/23.
//

import SwiftUI

struct MyList: View {
    
    @Binding
    var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        List {
            Section(
                header:
                    Text("오늘 할 일")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black),
                footer:
                    Text("footer")
            ) {
                ForEach(1...3, id: \.self) {
                    MyCard(icon: "book.fill", title: "책읽기 \($0)", start: "1 PM", end: "3 PM", bgColor: .green)
                }
            }
    //        .listRowInsets(EdgeInsets.init())
            
            Section(
                header:
                    Text("내일 할 일")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            ) {
                ForEach(1...10, id: \.self) {
                    MyCard(icon: "book.fill", title: "책읽기 \($0)", start: "1 PM", end: "3 PM", bgColor: .blue)
                }
            }
            
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("내 목록")
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
