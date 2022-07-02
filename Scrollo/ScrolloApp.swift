//
//  ScrolloApp.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 04/12/2021.
//

import SwiftUI

@main
struct ScrolloApp: App {
    @StateObject var genManager = EventManager()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(genManager)
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
