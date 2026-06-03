//
//  ContentView.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 5/29/26.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Tab 1
            Text("AI Quick Photo")
                .tabItem {
                    Label("Home", systemImage: "house.fill")  //new view
                }
            // Tab 2
            CreateImageHomeView()
                .tabItem {
                    Label("Create", systemImage: "person.fill")  //New View
                }
            // Tab 3
            GalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo.on.rectangle")
                        .symbolEffect(.pulse.byLayer, options: .repeating)
                }
        }
    }
}

#Preview {
    ContentView()
}
