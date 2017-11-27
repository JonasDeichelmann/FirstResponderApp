//
//  AppDelegate.swift
//  FirstResponder
//
//  Created by Jonas Deichelmann on 03.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import UserNotifications
import TB
import Alamofire
import SwiftyPlistManager
import CoreLocation
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        registerForPushNotifications()
        return true
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
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        let token = tokenParts.joined()
        SwiftyPlistManager.shared.getValue(for: "userID", fromPlistWithName: "Data") { (result, err) in
            if err == nil {
                let key = ""
                let uid = result!
                let params:[String:Any] = [
                    "key": key,
                    "userID":uid,
                    "token":token
                ]
                Alamofire.request("http://34.232.174.236/api/token/", method: .post, parameters: params, encoding: JSONEncoding.default).response { response in
                    print(response)
                }
            }
        }
        
        TB.info("Device Token: \(token)")
        Singelton.shared.TokenID = token
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        TB.info("Receive Notification")
        var url = ""
        SwiftyPlistManager.shared.getValue(for: "userID", fromPlistWithName: "Data") { (result, err) in
            if err == nil {
                if result != nil{
                    checkForInjury("", userID: result as! String) { coords  in
                        let lat = coords?.getLatitude()
                        let lon = coords?.getLongitude()
                        url = "http://maps.apple.com/maps?saddr=36.654775,-121.800588&daddr=\(lat!),\(lon!)"
                    }

                }
            }
        }
        let topWindow = UIWindow(frame: UIScreen.main.bounds)
        topWindow.rootViewController = UIViewController()
        topWindow.windowLevel = UIWindowLevelAlert + 1
        let alert = UIAlertController(title: "You got an Call!", message: "Hey, you got an Call.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "confirm"), style: .default, handler: {(_ action: UIAlertAction) -> Void in
            self.startNavigation(url: url)
            topWindow.isHidden = true
        }))
        topWindow.makeKeyAndVisible()
        topWindow.rootViewController?.present(alert, animated: true, completion: { _ in })

    }
    func startNavigation(url: String){
        UIApplication.shared.openURL(URL(string:url)!)
    }
    func checkForInjury(_ key:String, userID:String, completion: @escaping (geopoint?) -> Void) {
        let params:[String: Any] = [
            "key": key,
            "userID": userID
        ]
        var coords:geopoint?
        Alamofire.request("http://34.232.174.236/api/dest/", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            print(response)
            if response.result.isSuccess {
                let obj = JSON(response.result.value!)
                if obj.count >= 2{
                    let lan = obj[1].double!
                    let lat = obj[0].double!
                    coords = geopoint(latitude: lat,longitude: lan)
                    completion(coords)
                } else {
                    print("Couldn't get coords")
                }
            } else {
                print("couldn't reach server!")
            }
        }
    }

}

