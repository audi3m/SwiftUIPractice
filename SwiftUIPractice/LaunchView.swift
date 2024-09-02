//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by J Oh on 9/2/24.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("HELLO.\nMY POLAROID")
                    .font(.largeTitle).bold()
                    .scaleEffect(CGSize(width: 1.5, height: 1.3))
                Spacer()
                Image("sample1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
                Spacer()
                NavigationLink {
                    NicknameView()
                } label: {
                    Text("시작하기")
                        .font(.title3).bold()
                        .foregroundStyle(.white)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(.blue, in: Capsule())
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    LaunchView()
}
