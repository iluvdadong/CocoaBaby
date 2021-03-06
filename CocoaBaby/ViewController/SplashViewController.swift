//
//  SplashViewController.swift
//  CocoaBaby
//
//  Created by Sohn on 14/08/2017.
//  Copyright © 2017 Sohn. All rights reserved.
//

import UIKit
import FirebaseAuth

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            UserStore.shared.fetchUser(completion: { (result) in
                print("SplashViewController: User is not nil fetch user")
                switch result {
                case .success(_):
                    BabyStore.shared.fetchBaby(completion: { (baby) in
                        if baby != nil || UserStore.shared.user?.gender == "male" {
                            print("SplashViewController: Baby Exist go to MainTabBar")
                            self.presentMainTabViewController()
                        } else {
                            print("SplashViewController: Baby not exist go to TutorialViewController")
                            self.presentTutorialViewController()
                        }
                    })                    
                case .failure(_): // UserSettingsViewController로 이동
                    print("SplashViewController: Go to user setting.")
                    self.presentUserSettingsViewController()
                }
            })
        } else {
            print("SplashViewController: User is nil go to LoginViewController")
            presentLoginViewController()
        }
    }
    
    private func presentMainTabViewController() {
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "mainTabBarViewController")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    private func presentTutorialViewController() {
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        
        let tutorialStoryboard = UIStoryboard(name: "Tutorial", bundle: nil)
        let viewController = tutorialStoryboard.instantiateViewController(withIdentifier: "tutorialNavigationViewController")
        
        appDelegate.window?.rootViewController = viewController
        appDelegate.window?.makeKeyAndVisible()
        
    }
    
    private func presentLoginViewController() {
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "LoginViewController")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    private func presentUserSettingsViewController() {
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        
        let userSettingsSB = UIStoryboard(name: "UserSettings", bundle: nil)
        let viewController = userSettingsSB.instantiateViewController(withIdentifier: "UserSettingsViewController")
        
        appDelegate.window?.rootViewController = viewController
        appDelegate.window?.makeKeyAndVisible()

    }
}
