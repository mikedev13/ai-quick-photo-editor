//
//  GalleryView.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 6/2/26.
//

//MARK: Grid view with all the saved images

//View model load all images

import SwiftUI

struct GalleryView: View {
    // 1. Define sample data
    let items = Array(1...21)
    
    // 2. Configure 3 flexible columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            // 3. Implement the lazy vertical grid
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    //Text("Item \(item)")
                    AsyncImage(url: URL(string: "https://hips.hearstapps.com/hmg-prod/images/2026-ferrari-f80-176-686e843d2569f.jpg?crop=0.636xw:0.536xh;0.165xw,0.325xh&resize=700:*"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .frame(width: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GalleryView()
}
