//
//  AppDelegate.swift
//  YamboMasterProject
//
//  Created by Dennis Vera on 8/24/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let appearance = UINavigationBar.appearance()
        appearance.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "TrendSansOne", size: 17)!,
            NSForegroundColorAttributeName: UIColor(red: 40/255, green: 45/255, blue: 84/255, alpha: 1)
        ]

        return true
    }
}

