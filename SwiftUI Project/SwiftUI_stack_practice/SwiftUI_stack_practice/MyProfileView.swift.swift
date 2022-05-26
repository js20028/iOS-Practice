//
//  MyProfileView.swift.swift
//  SwiftUI_stack_practice
//
//  Created by 곽재선 on 2022/05/24.
//

import SwiftUI

struct MyProfileView: View {
    
    @Binding
    var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        Text("프로필")
            .navigationTitle("내 프로필")
            .navigationBarItems(trailing: NavigationLink(destination:Text("설정").font(.largeTitle)) {
                Image(systemName: "gear")
            })
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//
//                    }, label: {
//                        Text("설정")
//                    })
//                }
//            }
            .onAppear {
                self.isNavigationBarHidden = false
            }

    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
