//
//  AppDelegate.swift
//  smartTest
//
//  Created by Swaminarayan on 03/05/23.
//

import UIKit
import SMART

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let shared = AppDelegate()

    let smart = Client(baseURL: URL(string: "https://fhir-api-dstu2.smarthealthit.org")!, settings:
                        ["client_id": "smartTest", "redirect": "smartTest://callback"])
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
            
            // "smart" is your SMART `Client` instance
            if smart.awaitingAuthCallback {
                return smart.didRedirect(to: url)
            }
            return false
        }

}

