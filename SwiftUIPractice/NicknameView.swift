//
//  NicknameView.swift
//  SwiftUIPractice
//
//  Created by J Oh on 9/2/24.
//

import SwiftUI

struct NicknameView: View {
    @State private var nickname = ""
    @State private var profile = "person"
    @State private var showCompleteView = false
    
    
    var body: some View {
        VStack {
            NavigationLink {
                ProfileView(profile: $profile)
            } label: {
                Image(systemName: profile)
                    .font(.system(size: 60))
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.black)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 6))
            }
            .padding()
            
            VStack(spacing: 10){
                TextField("닉네임을 입력하세요", text: $nickname)
                Divider()
            }
            .padding(20)
             
            HStack(alignment: .top) {
                Text("MBTI")
                    .font(.title3).bold()
                
                Spacer()
                
                GridView()
                    .frame(width: 230, height: 100)
                 
            }
            .padding(30)
            
            Spacer()
            
            Button {
                showCompleteView.toggle()
            } label: {
                Text("완료")
                    .font(.title3).bold()
                    .foregroundStyle(.white)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(.blue, in: Capsule())
                    .padding()
            }
            
        }
        .navigationTitle("PROFILE SETTING")
        .sheet(isPresented: $showCompleteView) {
            CompleteView()
        }
    }
}

struct GridView: View {
    
    @State private var bools = [false, false, false, false, false, false, false, false]
    let mbtis = ["E", "S", "T", "J", "I", "N", "F", "P"]
    let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20),
                   GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(0..<8) { idx in
                Image(systemName: mbtis[idx].lowercased() + ".circle")
                    .font(.system(size: 50))
                    .foregroundStyle(.black.opacity(bools[idx] ? 1 : 0.3))
                    .onTapGesture {
                        bools[idx] = true
                        let opp = idx < 4 ? idx + 4 : idx - 4
                        bools[opp] = !bools[idx]
                    }
            }
        }
    }
}

#Preview {
    NicknameView()
}
