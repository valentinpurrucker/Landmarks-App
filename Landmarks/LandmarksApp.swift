//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 26.10.21.
//

import SwiftUI

@main
struct LandmarksApp: App {
	
	@StateObject var modelData = ModelData()
	
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(modelData)
        }
    }
}
