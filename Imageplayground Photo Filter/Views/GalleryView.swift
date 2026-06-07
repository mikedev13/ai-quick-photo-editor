//
//  GalleryView.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 6/2/26.
//

//MARK: Grid view with all the saved images
import SwiftUI

struct GalleryView: View {
    @State var viewModel: GalleryViewModel
    
    // 1. Define sample data
    let items = Array(1...21)
    
    // 2. Configure 3 flexible columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            // 3. Implement the lazy vertical grid
            Text("My Gallery \(viewModel.model.title)")
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    //Text("Item \(item)")
                    if let uiImage = viewModel.savedUIImage {
                        Image(uiImage: uiImage)
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .frame(width: 150)
                            //.resizable() //MARK: To do fix resizable()
                            .scaledToFit()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }

                }
            }
            .padding()
        }
        .task {
            viewModel.loadSavedImages()
        }
    }
}

#Preview {
    GalleryView(viewModel: GalleryViewModel(model: SavedGalleryModel(title: "", isCompleted: true, defaultImageString: "https://hips.hearstapps.com/hmg-prod/images/2026-ferrari-f80-176-686e843d2569f.jpg?crop=0.636xw:0.536xh;0.165xw,0.325xh&resize=700:*")))
}
