//
//  AppleSwiftUIApp.swift
//  AppleSwiftUI
//
//  Created by admin on 2022/01/07.
//

import SwiftUI

@main
struct AppleSwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
