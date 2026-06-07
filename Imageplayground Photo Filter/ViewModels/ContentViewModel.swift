//
//  Untitled.swift
//  Imageplayground Photo Filter
//
//  Created by Michael Forster on 6/7/26.
//
import Foundation
import SwiftUI


@MainActor
@Observable
class ContentViewModel {
    
    var model: HomeDataModel
    
    // Convenience init that builds the model internally
    init(appName: String = "") {
        self.model = HomeDataModel(appName: appName)
    }
    
    func setupHomeScreen() {
        guard let url = Bundle.main.url(forResource: "ai-app-summary", withExtension: "json") else {
                print("❌ Error: Could not find \("ai-app-summary").json in bundle.")
                return
            }
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let homeData = try decoder.decode(HomeDataModel.self, from: jsonData)
            model = homeData
            print("appName: \(homeData.appName)")
        } catch {
            print("Decoding failed: \(error)")
        }
    }
    

}
