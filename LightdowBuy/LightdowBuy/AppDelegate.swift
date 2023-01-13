

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
        
     
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = StartViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        Thread.sleep(forTimeInterval: 1.0)
        
    
        print("home\(NSHomeDirectory())")
        
        
      
        
        FirebaseApp.configure()
        
        return true
    }



}


