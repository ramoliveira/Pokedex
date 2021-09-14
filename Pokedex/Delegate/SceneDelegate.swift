//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Ramon Dias on 13/09/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Starting Dependency Injection
        startDepencies()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = HomeView()
            .preferredColorScheme(.light)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }

    func startDepencies() {
        Container.shared.register(PokemonServicing.self, component: PokemonService())
        guard let service = Container.shared.resolve(PokemonServicing.self) else { return }
        Container.shared.register(PokemonViewModel.self, component: PokemonViewModel(service: service))
    }
}

