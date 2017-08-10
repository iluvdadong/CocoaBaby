//
//  CustomTableViewCell.swift
//  CocoaBaby
//
//  Created by dadong on 2017. 8. 7..
//  Copyright © 2017년 Sohn. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
   
    @IBOutlet var labelBackgroundView: UIView!
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var addtionalDate: UILabel!
    @IBOutlet var weekLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        labelBackgroundView.layer.cornerRadius = 5
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func initViews(with diary: CKDiary) {
//        self.contentsLabel.text = diary.text
//        self.addtionalDate.text = "\(diary.day)"
//        self.weekLabel.text = "\(CocoaDateFormatter.getDay(from: diary))"
//    }

}
