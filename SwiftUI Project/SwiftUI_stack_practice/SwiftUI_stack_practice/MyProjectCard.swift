//
//  MyProjectCard.swift
//  SwiftUI_stack_practice
//
//  Created by 곽재선 on 2022/05/23.
//

import SwiftUI

struct MyProjectCard: View {
    
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            Text("ABC 프로젝트")
                .font(.system(size: 23))
                .fontWeight(.black)
            Spacer().frame(height: 3)
            Text("10 AM - 11 AM")
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
            HStack {
                Circle().frame(width: 50, height: 50)
                Circle().frame(width: 50, height: 50)
                Circle().frame(width: 50, height: 50)
                
                Spacer()
                
                Button(action: {
                    print("확인버튼 클릭")
                    
                    self.showAlert = true
                    
                }) {
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("알림창!"))
                }
                
                
                    
            }
        }
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
