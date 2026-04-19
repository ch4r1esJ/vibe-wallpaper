//
//  VibePaperApp.swift
//  VibePaper
//
//  Created by Charles Janjgava on 4/14/26.
//

import SwiftUI

@main
struct VibePaperApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                HomeView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .generateView: GenerateView()
                        }
                    }
            }
            .environmentObject(coordinator)
        }
    }
}
