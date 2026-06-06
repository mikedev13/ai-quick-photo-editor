//
//  GalleryViewModel.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 6/4/26.
//
import SwiftUI

@MainActor
@Observable
class GalleryViewModel {
    // @Published notifies the view to redraw whenever this property changes
    var model: SavedGalleryModel
    
    init(model: SavedGalleryModel) {
        self.model = model
    }
    
    //func load the save data
    
    func toggleCompletion() {
        model.isCompleted.toggle()
    }
}
