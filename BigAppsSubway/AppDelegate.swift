//
//  AppDelegate.swift
//  BigAppsSubway
//
//  Created by Robert Deans on 3/20/17.
//  Copyright © 2017 Robert Deans. All rights reserved.
//

import UIKit
<<<<<<< HEAD
=======
import GoogleMaps
>>>>>>> json

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

<<<<<<< HEAD
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
=======
    let googleAPI = "AIzaSyDLkK5fHf0Q6p0l1g521hqlg1UWAVZ7kgo"

    
    var window: UIWindow?
    var homeViewController: UIViewController!
    var navigationController: UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        GMSServices.provideAPIKey(googleAPI)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        homeViewController = MapViewController()
        
        let mainColor = UIColor(red: 0 / 255, green: 61 / 255, blue: 92 / 255, alpha: 1)
        
        navigationController = UINavigationController()
        navigationController.navigationBar.barTintColor = mainColor
        navigationController.navigationBar.alpha = 0.2
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController.viewControllers = [homeViewController]
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
        
>>>>>>> json
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

