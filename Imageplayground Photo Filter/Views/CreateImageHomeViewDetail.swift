//
//  CreateImageHomeViewDetail.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 5/29/26.
//
import SwiftUI
import PhotosUI

struct CreateImageHomeViewDetail: View {
    var imageSelectionType: PictureType
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var showPicker = false
    @State private var isWebImagVisable: Bool = false
    //@State private var processedImage: Image?
    @State private var showCamera = false
    @State private var capturedUIImage: UIImage? // optional if you want raw UIImage
    
    var body: some View {
        VStack {
            // Display the selected image
            selectedImage?
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            if isWebImagVisable {
                AsyncImage(url: URL(string: "https://hips.hearstapps.com/hmg-prod/images/2026-ferrari-f80-176-686e843d2569f.jpg?crop=0.636xw:0.536xh;0.165xw,0.325xh&resize=700:*"))
            }
            // The PhotosPicker component
            PhotosPicker(selection: $selectedItem, matching: .images) {
                Label("Select Photo", systemImage: "photo.on.rectangle")
            }
            .buttonStyle(.borderedProminent)
            Button("AI Sketch") {
                let _ = print("SKETCH")
            }
            .buttonStyle(.borderedProminent)
        }
        .onChange(of: selectedItem) {
            Task {
                if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = Image(uiImage: uiImage)
                }
            }
        }
        .onAppear {
            switch imageSelectionType {
            case .galleryImage:
                showPicker = true
            case .webImage:
                isWebImagVisable = true
            case .cameraImage:
                showCamera = true
            }
        }
        .photosPicker(isPresented: $showPicker, selection: $selectedItem, matching: .images)
        .padding()
        .sheet(isPresented: $showCamera) {
            CameraPicker(image: $capturedUIImage)
        }
        .onChange(of: capturedUIImage) {
            if let uiImage = capturedUIImage {
                selectedImage = Image(uiImage: uiImage)
            }
        }
    }
}

#Preview {
    CreateImageHomeViewDetail(imageSelectionType: PictureType.webImage) //PictureType.galleryImage
}
