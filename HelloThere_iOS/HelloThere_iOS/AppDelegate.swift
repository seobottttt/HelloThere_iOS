//
//  AppDelegate.swift
//  HelloThere_iOS
//
//  Created by 서보현 on 2023/07/11.
//

import UIKit
import NaverThirdPartyLogin
import KakaoSDKCommon
import KakaoSDKAuth
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        NaverThirdPartyLoginConnection.getSharedInstance()?.isNaverAppOauthEnable = true
//        NaverThirdPartyLoginConnection.getSharedInstance()?.isInAppOauthEnable = true
//
//        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
//            ///  네이버앱으로 로그인
//        instance?.isNaverAppOauthEnable = true
//            /// 사파리로 로그인
//        instance?.isInAppOauthEnable = true
//
//        instance?.serviceUrlScheme = "naverlogin"
//        instance?.consumerKey = "CaumfgJQIl36Ms8HRD9e"
//        instance?.consumerSecret = "Gd_ILGoPgK"
//        instance?.appName = "HelloThere"
//        // Override point for customization after application launch.
//
//        let nativeAppKey = Bundle.main.infoDictionary?["1233b21d249bb19573588fd36caef2a2"] ?? ""
//
//        KakaoSDK.initSDK(appKey: nativeAppKey as! String)
//        return true
//    }


    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        NaverThirdPartyLoginConnection.getSharedInstance()?.application(app, open: url, options: options)
//            return true
//        if (AuthApi.isKakaoTalkLoginUrl(url)) {
//            return AuthController.handleOpenUrl(url: url)
//        }
//        if GIDSignIn.sharedInstance.handle(url){
//            return true
//        }
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

