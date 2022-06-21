//
//  ScrolloApp.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 04/12/2021.
//

import SwiftUI

@main
struct ScrolloApp: App {
    @StateObject var genManager = GeneratorsManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(genManager)
        }
    }
}
