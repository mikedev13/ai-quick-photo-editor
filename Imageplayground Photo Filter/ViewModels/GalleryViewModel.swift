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
    var model: SavedGalleryModel
    var savedUIImage: UIImage?
    
    init(model: SavedGalleryModel) {
        self.model = model
    }
    
    
    func toggleCompletion() {
        model.isCompleted.toggle()
    }
    
    func loadSavedImages() {
        if let uiImg = ImageFileManager.shared.loadImage(name: "Test1") {
            savedUIImage = uiImg
        }
    }
}
