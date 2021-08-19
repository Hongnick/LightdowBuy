

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        auth.addStateDidChangeListener { [weak self] (_, user) in
//                if let user = user {
//                    // user is already logged in
//                } else {
//                    // user is not logged in
//                }
//            }
//
//
        
        Thread.sleep(forTimeInterval: 2.0)
        
        
        
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        let navController = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = navController

        
        
        
        
        
        
        print("home\(NSHomeDirectory())")
        
        
      
        
        FirebaseApp.configure()
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


}


