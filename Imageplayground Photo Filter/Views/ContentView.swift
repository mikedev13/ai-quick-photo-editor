//
//  ContentView.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 5/29/26.
//
import SwiftUI

struct ContentView: View {
    @State var viewModel = ContentViewModel(model: HomeDataModel(appName: ""))
    
    var body: some View {
        TabView {
            // Tab 1
            Text(viewModel.model.appName)
                .tabItem {
                    Label("Home", systemImage: "house.fill")  //new view
                }
            // Tab 2
            CreateImageHomeView()
                .tabItem {
                    Label("Create", systemImage: "person.fill")  //New View
                }
            // Tab 3
            GalleryView(viewModel: GalleryViewModel(model: SavedGalleryModel(title: "Mike Data", isCompleted: true, defaultImageString: "https://hips.hearstapps.com/hmg-prod/images/2026-ferrari-f80-176-686e843d2569f.jpg?crop=0.636xw:0.536xh;0.165xw,0.325xh&resize=700:*")))
                .tabItem {
                    Label("Gallery", systemImage: "photo.on.rectangle")
                        .symbolEffect(.pulse.byLayer, options: .repeating)
                }
        }
        .task {
            viewModel.setupHomeScreen()
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(model: HomeDataModel(appName: "AI Photo App (PREVIEW)")))
}
