//
//  CreateImageHomeView.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 5/29/26.
//
import SwiftUI

//public enum PictureType: String, CaseIterable, Identifiable {
public enum PictureType: String {
    case galleryImage, webImage, cameraImage
    
    // Identifiable requires an 'id' property
    //var id: Self { self }
}


//MARK: Update UI
struct CreateImageHomeView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Select Gallery") {
                    //print("Button 1 tapped")
                    path.append(PictureType.galleryImage.rawValue)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Random Web Image") {
                    //print("Button 2 tapped")
                    path.append(PictureType.webImage.rawValue)
                }
                .buttonStyle(.bordered)
                
                Button("Camera Photo") {
                   //print("Button 3 tapped")
                    path.append(PictureType.cameraImage.rawValue)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(for: String.self) { pictureType in
                let _ = print("pictureType:", pictureType)
                CreateImageHomeViewDetail(imageSelectionType: PictureType(rawValue: pictureType) ?? PictureType.galleryImage)
            }
            .padding()
        }
    }
}

#Preview {
    CreateImageHomeView()
}


