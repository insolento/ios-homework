
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        let tabbarController = UITabBarController()
        tabbarController.tabBar.backgroundColor = .white

        
        let profile = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profile)
        let profileName = UITabBarItem()
        profileName.image = UIImage(systemName: "person.crop.circle")
        profileName.title = "Profile"
        profileNavigationController.tabBarItem = profileName
        
        let feed = FeedViewController()
        let feedNavigationController = UINavigationController(rootViewController: feed)
        let feedName = UITabBarItem()
        feedName.title = "Feed"
        feedName.image = UIImage(systemName: "house")
        
        
        
        feedNavigationController.tabBarItem = feedName
        
        
        tabbarController.viewControllers = [profileNavigationController, feedNavigationController]
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        return true
    }
}

