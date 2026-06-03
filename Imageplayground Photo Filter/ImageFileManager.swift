//
//  ImageFileManager.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 6/3/26.
//
import SwiftUI
import UIKit

class ImageFileManager {
    static let shared = ImageFileManager()
    
    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // Save image to disk
    func saveImage(uiImage: UIImage, name: String) {
        // Compress the image to JPEG data
        guard let data = uiImage.jpegData(compressionQuality: 0.8) else { return }
        let url = getDocumentsDirectory().appendingPathComponent("\(name).jpg")
        
        do {
            try data.write(to: url)
            print("Saved successfully to: \(url.path)")
        } catch {
            print("Error saving image: \(error.localizedDescription)")
        }
    }
    
    // Load image from disk
    func loadImage(name: String) -> UIImage? {
        let url = getDocumentsDirectory().appendingPathComponent("\(name).jpg")
        guard let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }
}

