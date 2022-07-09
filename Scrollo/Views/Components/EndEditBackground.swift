//
//  EndEditBackground.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 09/07/2022.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
    }
}
