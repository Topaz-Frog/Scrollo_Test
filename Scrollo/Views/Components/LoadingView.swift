import SwiftUI

struct LoadingView: View {
    
    @State var progress: CGFloat = 1.0
    @State var loadingTime: Double
    static let gradientStart = Constants.Colors.LightBlueBackground
    static let gradientEnd = Constants.Colors.OrangeBackground
    
    var body: some View {
        VStack {
            
            ZStack {
                GeometryReader { geometry in
                    Path { path in
                        var width: CGFloat = min(geometry.size.width, geometry.size.height)
                        let height = width
                        let xScale: CGFloat = 0.832
                        let xOffset = (width * (1.0 - xScale)) / 2.0
                        width *= xScale
                        path.move(
                            to: CGPoint(
                                x: width * 0.95 + xOffset,
                                y: height * (0.20 + Dice.adjustment)
                            )
                        )

                        Dice.segments.forEach { segment in
                            path.addLine(
                                to: CGPoint(
                                    x: width * segment.line.x + xOffset,
                                    y: height * segment.line.y
                                )
                            )

                            path.addQuadCurve(
                                to: CGPoint(
                                    x: width * segment.curve.x + xOffset,
                                    y: height * segment.curve.y
                                ),
                                control: CGPoint(
                                    x: width * segment.control.x + xOffset,
                                    y: height * segment.control.y
                                )
                            )
                        }
                    }
                    .fill(.linearGradient(
                        Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: UnitPoint(x: 0.5, y: progress-0.05),
                        endPoint: UnitPoint(x: 0.5, y: progress)
                    ))
                }
            }
        }
        .background(Constants.Colors.DarkBlueBackground)
        .onAppear {
            startLoading()
        }
    }
    
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: loadingTime/100, repeats: true) { timer in
            withAnimation() {
                self.progress -= 0.01
                if self.progress <= 0.05 {
                    timer.invalidate()
                    self.progress = 0.01
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(loadingTime: 3.0)
    }
}
