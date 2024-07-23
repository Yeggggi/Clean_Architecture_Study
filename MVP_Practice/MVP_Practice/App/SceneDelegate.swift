//
//  SceneDelegate.swift
//  MVP_Practice
//
//  Created by Yeji Seo on 7/22/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = CardViewController(presenter: CardPresenter())
        window?.makeKeyAndVisible()
    }
}
