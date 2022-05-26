//
//  ContentView.swift
//  SwiftUI_stack_practice
//
//  Created by 곽재선 on 2022/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack {
                        
                        NavigationLink(destination: MyList(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                            Image(systemName: "line.horizontal.3")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        
                        
                        Spacer()
                        
                        NavigationLink(destination: MyProfileView(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding(20)
                    
                    Text("할 일 목록")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .padding(.horizontal, 20)

                    
                    ScrollView {
                        VStack {
                            MyProjectCard()
                            MybasicCard()
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "3 PM", end: "4 PM", bgColor: .blue)
                        }
                        .padding()
                    }
                    
                }
                
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(10)
                    .shadow(radius: 20)
            } // ZStack
            .navigationTitle("메인화면")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        } // NavigationView
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
