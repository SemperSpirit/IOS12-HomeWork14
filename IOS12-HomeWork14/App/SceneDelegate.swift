//
//  SceneDelegate.swift
//  IOS12-HomeWork14
//
//  Created by Kaiten Aiko on 27.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = PhotoAlbums()
        window?.rootViewController = PhotoAlbums()
        window?.makeKeyAndVisible()
    }
}

