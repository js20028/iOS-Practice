//
//  MyTextView.swift
//  SwiftuiPractice
//
//  Created by 곽재선 on 2022/05/19.
//

import SwiftUI

struct MyTextView: View {
    
    @State
    private var index: Int = 0
    
    private let backgroundColors = [
        Color.red,
        Color.blue,
        Color.yellow,
        Color.green,
        Color.orange
    ]
    
    @Binding
    var isActivated: Bool
    
    init(isActivated: Binding<Bool> = .constant(true)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity,  minHeight: 0, maxHeight: 100)
            Text("활성화 상태: \(String(self.isActivated))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(self.isActivated ? Color.yellow : Color.gray )
                .background(Color.black)
                
            Spacer()
        }
        .background(backgroundColors[self.index])
        .onTapGesture {
            if self.index == self.backgroundColors.count-1 {
                self.index = 0
            } else {
                self.index += 1
            }
        }
    }
}

struct MytextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
