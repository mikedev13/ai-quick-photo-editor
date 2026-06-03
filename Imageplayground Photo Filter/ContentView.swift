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
            Text("My Gallery")
                .tabItem {
                    Label("Gallery", systemImage: "house.fill")  //new view
                }
            // Tab 2
            CreateImageHomeView()
                .tabItem {
                    Label("Create", systemImage: "person.fill")  //New View
                }
        }
    }
}

#Preview {
    ContentView()
}
