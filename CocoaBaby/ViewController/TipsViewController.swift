//
//  TipsViewController.swift
//  CocoaBaby
//
//  Created by Sohn on 04/08/2017.
//  Copyright © 2017 Sohn. All rights reserved.
//

import UIKit

class TipsViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var weeks = ["week 1", "week 2","week 3", "week 4", "week 5"]
    
    @IBOutlet var tipsCollectionView: UICollectionView!
    //@IBOutlet var tipsTabelView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20 , left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: view.frame.width/2 - 30, height: 160)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        
        self.tipsCollectionView.collectionViewLayout = layout
        
        self.tipsCollectionView.backgroundColor = UIColor(patternImage: UIImage(named: "Gradation2")!)
        self.tipsCollectionView.delegate = self
        self.tipsCollectionView.dataSource = self
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weeks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tipsCollectionView.dequeueReusableCell(withReuseIdentifier: "TipsCollectionViewCell", for: indexPath) as! TipsCollectionViewCell 
        cell.imageView.backgroundColor = .white
        cell.imageView.image = #imageLiteral(resourceName: "CocoaBaby")
        cell.title.text = weeks[indexPath.row]
        cell.title.font = UIFont(name: cell.title.font.fontName, size: 13)
        cell.title.textColor = .white
        cell.backgroundColor = UIColor.clear
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let tipsDetailViewController = storyBoard.instantiateViewController(withIdentifier: "TipsDetailViewController") as! TipsDetailViewController
        
        self.navigationController?.pushViewController(tipsDetailViewController, animated: true)

    }
    
//    // flow Layout
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
    
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weeks.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tipsTabelView.dequeueReusableCell(withIdentifier: "TipsTabelViewCell", for: indexPath) as! TipsTableViewCell
//        
//        cell.title.text = self.weeks[indexPath.row]
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let tipsDetailViewController = storyBoard.instantiateViewController(withIdentifier: "TipsDetailViewController") as! TipsDetailViewController
//        
//        self.navigationController?.pushViewController(tipsDetailViewController, animated: true)
//    }

}
