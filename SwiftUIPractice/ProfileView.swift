//
//  ProfileView.swift
//  SwiftUIPractice
//
//  Created by J Oh on 9/2/24.
//

import SwiftUI

struct ProfileView: View {
    @Binding var profile: String
    private let list = ["figure.walk", "figure.wave", "airplane", "car",
                "bus", "tram", "ferry", "sailboat", "scooter",
                "truck.box", "bicycle", "train.side.front.car"]
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible()),
                   GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            Image(systemName: profile)
                .font(.system(size: 60))
                .frame(width: 120, height: 120)
                .foregroundStyle(.black)
                .overlay(Circle().stroke(Color.blue, lineWidth: 6))
                .padding()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(list, id: \.self) { item in
                    let selected = profile == item
                    Image(systemName: item)
                        .font(.system(size: 40))
                        .foregroundStyle(.black.opacity(selected ? 1 : 0.3))
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(selected ? .blue : .gray, lineWidth: 4))
                        .onTapGesture {
                            profile = item
                            print(item)
                        }
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("PROFILE SETTING")
        
    }
}

#Preview {
    ProfileView(profile: .constant("car"))
}
