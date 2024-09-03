//
//  SearchView.swift
//  SwiftUIPractice
//
//  Created by J Oh on 9/2/24.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    var like = false
}

let items = [
    Item(imageName: "star", title: "Star", subtitle: "A beautiful star"),
    Item(imageName: "moon", title: "Moon", subtitle: "Shining moon in the sky"),
    Item(imageName: "sun.max", title: "Sun", subtitle: "Bright and warm sun"),
    Item(imageName: "cloud", title: "Cloud", subtitle: "Fluffy white cloud"),
    Item(imageName: "bolt", title: "Lightning", subtitle: "A sudden flash of lightning"),
    Item(imageName: "snow", title: "Snow", subtitle: "Falling snowflakes"),
    Item(imageName: "flame", title: "Fire", subtitle: "A bright flame"),
    Item(imageName: "leaf", title: "Leaf", subtitle: "A green leaf"),
    Item(imageName: "drop", title: "Water Drop", subtitle: "A single drop of water"),
    Item(imageName: "heart", title: "Heart", subtitle: "A symbol of love"),
    Item(imageName: "house", title: "House", subtitle: "A cozy home"),
    Item(imageName: "car", title: "Car", subtitle: "A fast car"),
    Item(imageName: "airplane", title: "Airplane", subtitle: "Flying in the sky"),
    Item(imageName: "bicycle", title: "Bicycle", subtitle: "A healthy ride"),
    Item(imageName: "book", title: "Book", subtitle: "A source of knowledge"),
    Item(imageName: "camera", title: "Camera", subtitle: "Capture the moment"),
    Item(imageName: "globe", title: "Globe", subtitle: "The whole world"),
    Item(imageName: "pencil", title: "Pencil", subtitle: "Write your ideas"),
    Item(imageName: "phone", title: "Phone", subtitle: "Stay connected"),
    Item(imageName: "music.note", title: "Music", subtitle: "Feel the rhythm"),
]

struct SearchView: View {
    
    @State private var query = ""
    @State private var filteredItems = items
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($filteredItems) { item in
                    CircleImage(item: item)
                }
            }
            .navigationTitle("Search")
            .listStyle(.plain)
            .searchable(text: $query)
            .onChange(of: query) { oldValue, newValue in
                if newValue.isEmpty {
                    filteredItems = items
                } else {
                    filteredItems = items.filter { $0.title.lowercased().contains(query.lowercased()) ||
                        $0.subtitle.lowercased().contains(query.lowercased())
                    }
                }
            }
        }
    }
}

struct CircleImage: View {
    @Binding var item: Item
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: item.imageName)
                .bold()
                .foregroundStyle(.white)
                .padding(10)
                .background(Color(red: .random(in: 0...0.7), green: .random(in: 0...0.7), blue: .random(in: 0...0.7)), in: Circle())
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                Text(item.subtitle)
            }
            Spacer()
            Button {
                item.like.toggle()
            } label: {
                Image(systemName: item.like ? "star.fill" : "star")
                    .font(.title2)
                    .foregroundStyle(item.like ? .yellow : .black)
            }
        }
        
        
    }
}
 

#Preview {
    SearchView()
}
 
