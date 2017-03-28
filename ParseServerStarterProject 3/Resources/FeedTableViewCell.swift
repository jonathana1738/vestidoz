//
//  FeedTableViewCell.swift
//  DresSwapMvp
//
//  Created by Jonathan on 3/23/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit


class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet var ScrollView: UIScrollView!

     var FrontImaged = true
    
       @IBOutlet var DressImages: UIImageView!
    
    
    @IBOutlet var BrandLabel: UILabel!
    @IBOutlet var SizeLabel: UILabel!
    @IBOutlet var LengthLabel: UILabel!
    @IBOutlet var ColorLabel: UILabel!
    @IBOutlet var MaterialLabel: UILabel!
    @IBOutlet var WashingPrfLabel: UILabel!
    @IBOutlet var TypeOfFitLabel: UILabel!
    @IBOutlet var isAvailableLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        //ScrollView.contentSize.width = ScrollView.frame.width //* CGFloat(i + 1)
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       
    }

}
