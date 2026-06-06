//
//  GalleryViewModel.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 6/4/26.
//
//have a model

//func load the save data
import SwiftUI
import Combine //mARK MOVE TO SWIFT CONCURRENCY

class GalleryViewModel: ObservableObject {
    // @Published notifies the view to redraw whenever this property changes
    @Published var model: SavedGalleryModel
    
    init(model: SavedGalleryModel) {
        self.model = model
    }
    
    func toggleCompletion() {
        model.isCompleted.toggle()
    }
}
