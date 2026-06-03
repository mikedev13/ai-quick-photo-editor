//
//  GalleryView.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 6/2/26.
//

//MARK: Grid view with all the saved images

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
                    Text("Item \(item)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}
