//
//  Line.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 06/07/2022.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX + 20, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.minY))

        return path
    }
}
