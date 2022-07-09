//
//  ScrolloApp.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 04/12/2021.
//

import SwiftUI

@main
struct ScrolloApp: App {
    @StateObject var eventManager = EventManager()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some Scene {
        WindowGroup {
            if eventManager.isValidated {
                ContentView()
                    .environmentObject(eventManager)
            } else {
                LoginView()
                    .environmentObject(eventManager)
            }
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

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
