//
//  ContentView.swift
//  Image_tutorial
//
//  Created by 곽재선 on 2022/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CircleImageView()
            CircleImageView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
