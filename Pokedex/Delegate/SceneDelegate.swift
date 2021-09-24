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
        SContainer.shared.register(PokemonServicing.self) { _ in
            PokemonService()
        }
        SContainer.shared.register(PokemonViewModel.self) { resolver in
            PokemonViewModel(service: resolver.resolve(PokemonServicing.self)!)
        }
        
        let contentView = HomeView()
            .preferredColorScheme(.light)

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
}

