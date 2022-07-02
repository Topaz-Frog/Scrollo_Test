//
//  GrowingButton.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 02/07/2022.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    @State var background_color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(background_color)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
