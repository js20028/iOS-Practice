//
//  CircleImageView.swift
//  Image_tutorial
//
//  Created by 곽재선 on 2022/05/22.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
//        Image(systemName: "flame.fill")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
        Image("TOScel")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay(
                Circle().opacity(0.5)
            )
            .overlay(
                Circle().stroke(Color.red, lineWidth: 3).padding(10)
            )
            .overlay(
                Circle().stroke(Color.green, lineWidth: 5).padding(20)
            )
            .overlay(
                Circle().stroke(Color.blue, lineWidth: 5)
            )
            .overlay(
                Text("토스")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .fontWeight(.bold)
            )
            
            
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
