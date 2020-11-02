//
//  SceneDelegate.swift
//  lab_1
//
//  Created by Антон Тимонин on 16.10.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Catalog Module
        let catalogNavController = UINavigationController(rootViewController: Builder.buildCatalogModule())
        if let catalogEmptyDataImg = UIImage(named: "emptyBuy")?.pngData(), let catalogFilledDataImg = UIImage(named: "filledBuy")?.pngData() {
            let emptyImg = UIImage(data: catalogEmptyDataImg, scale: 6.5)
            let filledImg = UIImage(data: catalogFilledDataImg, scale: 6.5)
            let barItem = UITabBarItem(title: "", image: emptyImg, selectedImage: filledImg)
            catalogNavController.tabBarItem = barItem
        }
        
        // Favourite Module
        let favouriteNavController = UINavigationController(rootViewController: Builder.buildFavouriteModule())
        if let favouriteEmptyDataImg = UIImage(named: "emptyFavourite")?.pngData(), let favouriteFilledDataImg = UIImage(named: "filledFavourite")?.pngData() {
            let emptyImg = UIImage(data: favouriteEmptyDataImg, scale: 7.25)
            let filledImg = UIImage(data: favouriteFilledDataImg, scale: 7.25)
            let barItem = UITabBarItem(title: "", image: emptyImg, selectedImage: filledImg)
            favouriteNavController.tabBarItem = barItem
        }
        
        // Cart Module
        let cartNavController = UINavigationController(rootViewController: Builder.buildCartModule())
        if let cartEmptyDataImg = UIImage(named: "emptyCart")?.pngData(), let cartFilledDataImg = UIImage(named: "filledCart")?.pngData() {
            let emptyImg = UIImage(data: cartEmptyDataImg, scale: 7.4)
            let filledImg = UIImage(data: cartFilledDataImg, scale: 7.4)
            let barItem = UITabBarItem(title: "", image: emptyImg, selectedImage: filledImg)
            cartNavController.tabBarItem = barItem
        }
        
        // Tab Bar Module
        let tabBar = UITabBarController()
        tabBar.setViewControllers([catalogNavController, favouriteNavController, cartNavController], animated: true)
        
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        tabBar.selectedViewController = catalogNavController
        window.rootViewController = tabBar
        self.window = window
        window.makeKeyAndVisible()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

