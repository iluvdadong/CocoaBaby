//
//  HomeViewController.swift
//  CocoaBaby
//
//  Created by Sohn on 02/08/2017.
//  Copyright © 2017 Sohn. All rights reserved.
//

import UIKit
import CloudKit

class HomeViewController: BaseViewController {
    
    @IBOutlet var babyImageView: UIImageView!
    @IBOutlet var babyView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dDayLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var weekLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        babyImageView.image = UIImage(named: "CocoaBaby")?.withRenderingMode(.alwaysTemplate)
        babyImageView.tintColor = UIColor.mainBlueColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateBabyInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateBabyView()
        
        print(CKShareMetadata())
        
        if BabyStore.shared.baby == nil {
            let tutorialStoryboard = UIStoryboard(name: "Tutorial", bundle: nil)
            let viewController = tutorialStoryboard.instantiateViewController(withIdentifier: "tutorialNavigationViewController")
            present(viewController, animated: false, completion: nil)
        }
        
//        FirebaseDataController.shared.saveUser()
        FirebaseDataController.shared.loadUser()
    }
    
    // MARK: - Methods
    private func updateBabyInfo() {
        self.nameLabel.text = BabyStore.shared.getName()
        let dDay = BabyStore.shared.getDday()
        self.dDayLabel.text = "D\(dDay.mark)\(dDay.value)"
        self.infoLabel.text = "1주차에는 5대 영양소를 골고루!"
        self.weekLabel.text = "Week \(BabyStore.shared.getPregnantWeek().week)"
    }
    
    private func updateBabyView() {
        babyView.layer.cornerRadius = babyView.frame.width/2
    }

}
