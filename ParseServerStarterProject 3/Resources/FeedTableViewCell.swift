//
//  FeedTableViewCell.swift
//  DresSwapMvp
//
//  Created by Jonathan on 3/23/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit


class FeedTableViewCell: UITableViewCell {

     var FrontImaged = true
    @IBAction func FrontButton(_ sender: Any) {
        FrontImaged = true
        
        
        
    }

    @IBAction func BackButton(_ sender: Any) {
        FrontImaged = false
    }
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
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       
    }

}
