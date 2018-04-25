//
//  AppDelegate.swift
//  NewPorject
//
//  Created by idea on 2018/4/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import CYLTabBarController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,UITabBarControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
         loadAllViewController()
        return true
    }
    //加载所有的视图控制器
    func loadAllViewController(){
        CYLPlusButtonSubclass.register()
        let mainTabBarVc = MainTabBarController(viewControllers: self.viewControllers(), tabBarItemsAttributes: self.tabBarItemsAttributesForController())
        self.window = UIWindow()
        self.window?.frame  = UIScreen.main.bounds
        self.window?.rootViewController = mainTabBarVc
        self.window?.makeKeyAndVisible()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    
    //加载登录视图控制器
    func loadLoginViewController(){
//        UIStoryboard * storyboard = [UIStoryboard, storyboardWithName:@"loginViewController" bundle:nil];
//
//        UINavigationController * nav = [storyboard  instantiateViewControllerWithIdentifier:@"Login"];
//
//        self.window.rootViewController = nav;
    }
    
    func viewControllers() -> [UINavigationController]{
        let home = UINavigationController(rootViewController: HomeViewController())
        let order = UINavigationController(rootViewController: TitleViewController())
        let manage = UINavigationController(rootViewController: ManageViewController())
        let mine =   UINavigationController(rootViewController: MineViewController())
        let viewControllers = [home, order,manage, mine]
        
        return viewControllers
        
    }
    func tabBarItemsAttributesForController() ->  [[String : String]] {
        
        let tabBarItemOne = [CYLTabBarItemTitle:"首页",
                             CYLTabBarItemImage:"icon_tab_guangchang_n",
                             CYLTabBarItemSelectedImage:"icon_tab_guangchang_h"]
        
        let tabBarItemTwo = [CYLTabBarItemTitle:"订单",
                             CYLTabBarItemImage:"icon_tab_guanli_n",
                             CYLTabBarItemSelectedImage:"icon_tab_guanli_h"]
        
        let tabBarItemThree = [CYLTabBarItemTitle:"管理",
                               CYLTabBarItemImage:"icon_tab_guanli_n",
                               CYLTabBarItemSelectedImage:"icon_tab_guanli_h"]
        
        let tabBarItemFour = [CYLTabBarItemTitle:"我的",
                              CYLTabBarItemImage:"icon_tab_wo_n",
                              CYLTabBarItemSelectedImage:"icon_tab_wo_h"]
        let tabBarItemsAttributes = [tabBarItemOne,tabBarItemTwo,tabBarItemThree,tabBarItemFour]
        return tabBarItemsAttributes
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

