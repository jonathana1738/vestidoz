//
//  FeedTableViewCell.swift
//  DresSwapMvp
//
//  Created by Jonathan on 3/23/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse


class FeedTableViewCell: UITableViewCell {
    
 
  
    @IBOutlet var BackImageView: UIImageView!

    @IBAction func RequestNowBtn(_ sender: Any) {
     print(objectIDLabel.text)
        
      var query = PFQuery(className:"Posts")
        
        query.whereKey("objectId", equalTo: objectIDLabel.text!)

        query.findObjectsInBackground { (objects, error) -> Void in
            
            
            if error == nil {

                print(objects)

                
                for object in objects! {
                    
                    object["isAvailable"]  = false
                    object["requestedById"]  = PFUser.current()!.objectId
                    object["requestedByUserName"]  = PFUser.current()!.username
                    object["requestedByEmail"]  = PFUser.current()!.email

                    object.saveInBackground()
                }

            } else {
                print(error)
            }
        }
    }
    
    
    
     var FrontImaged = true
    
    @IBOutlet var DressImages: UIImageView!
    
    @IBOutlet var objectIDLabel: UILabel!
    @IBOutlet var RequestNow: UIButton!
    
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
