//
//  SceneDelegate.swift
//  myCalculator-Ver2
//
//  Created by Kirill Sklyarov on 16.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let presenter = MainPresenter()
        let mainVC = MainViewController(presenter: presenter)
        presenter.view = mainVC
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
    }

}

