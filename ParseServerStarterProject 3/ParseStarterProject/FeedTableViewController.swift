//
//  FeedTableViewController.swift
//  DresSwapMvp
//
//  Created by Jonathan on 3/23/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse


class FeedTableViewController: UITableViewController {
    
   
    
    var DressFront = UIImage()
    var DressBack = UIImage()
    
 
    
  
    var imageF =  Array<PFFile>()
    var imageB =  Array<PFFile>()
    var SwapArray = Array<DressSwap>()
    var refresher: UIRefreshControl!
    
    func refresh() {
        
        
        let query = PFQuery(className:"Posts")
        query.order(byDescending: "createdAt")
        query.limit = 10
        query.findObjectsInBackground { (objects, error) -> Void in
            
            if error == nil {
                self.SwapArray.removeAll()
                
                
                for object in objects! {
                    
                    var Swap: DressSwap
                    
  
                  
                   Swap = DressSwap(Brand: object["Brand"] as! String,
                  Available: (object["isAvailable"] as! Bool),
                   Size: (object["Size"] as! Int),
                    length: object["Length"] as! String,
                     Color: object["Color"] as! String,
                   fabric: object["Fabric"] as! String,
                   washPref: object["WashingPrfrnce"] as! String,
                 typOFit: object["Fit"] as! String,
                   FrontImage: object["FrontImage"] as!PFFile,
                   BackImage: object["BackImage"] as! PFFile,
                 createdAt: object.createdAt!)
                self.SwapArray.append(Swap)
                }
                
                print("Count: " + String(self.SwapArray.count))
                print(String(describing: self.SwapArray[0]))
                
                // Reload tableview
                self.tableView.reloadData()
            } else {
                print(error)
            }
            
            self.refresher.endRefreshing()
        }
    }
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Refreshing...")
        refresher.addTarget(self, action: #selector(FeedTableViewController.refresh), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(refresher)
        
        refresh()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SwapArray.count
    }

    
    
    
        

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        print(self.imageF.count)
    
        imageF.append(SwapArray[indexPath.row].FrontImage)
        imageB.append(SwapArray[indexPath.row].BackImage)
        
        
       
       
            imageF[indexPath.row].getDataInBackground { (data, error) in
            
                if let downloadedImage = UIImage(data: data!){
                   self.DressFront = downloadedImage
                     cell.DressImages.image = downloadedImage
                }
           }
            
      
//            
//            imageB[indexPath.row].getDataInBackground { (data, error) in
//                
//                if let downloadedImage = UIImage(data: data!){
//                    cell.DressImages.image = downloadedImage
//                
//                }
//
//            
//            
//            }
//      
//        
        
        
        

        
        
        // retrive 1 image, save to the struct as UIMAGE
//       let FrontPicture = ["FrontImage"] as! PFFile
//        FrontPicture.getDataInBackground { (data, error) in
//            if let imageData = data{
//                let FrontPicture = UIImage(data:imageData)
//                cell.DressImages.image = FrontPicture
//                
//            }
//        }
    
    
        
        
        // then convert the pffile to a image
        // then display the image
        
        // retrive 2 images
        // then convert the pffile to a image
        // then display the images
        
        
        
//        let findData = PFQuery(className: "Posts")
//        findData.findObjectsInBackground { (objects, error) in
//            
//            if (error == nil) {
//                
//                for object in objects!{
//                    let FrontPicture = object ["FrontImage"] as! PFFile
//                    let BackPicture = object ["BackImage"] as! PFFile
//                    
//                    FrontPicture.getDataInBackground(block: { (data, error) in
//                         self.FrontImaged = true
//                        if let imageData = data{
//                           
//                            if self.FrontImaged{
//                        let FrontPicture = UIImage(data:imageData)
//                            cell.DressImages.image = FrontPicture
//                                
//                        }
//                              self.FrontImaged = false
//                        }
//                    })
//                    
//                    BackPicture.getDataInBackground(block: { (data, error) in
//                       self.BackImaged = true
//                        if let imageData = data{
//                            if self.BackImaged{
//                            let BackPicture = UIImage(data:imageData)
//                            cell.DressImages.image = BackPicture
//                            }
//                            self.BackImaged = false
//                        }
//                    })

                  
//                    
//                }
//                
//}
//
//            }
        
        

//         imageFiles[indexPath.row].getDataInBackground { (data, error) in
//
//          if let imageData = data{
//          if let downloadedImage = UIImage(data: imageData){
//        cell.DressImages.image = downloadedImage
//    
//           //print(downloadedImage)
//          }
//          }
//   }

       // cell.DressImages.image = self.SwapArray[indexPath.row].FrontImage
        //cell.DressImages.image = UIImage(named: "pink")
        cell.BrandLabel.text = "Brand: " + String(self.SwapArray[indexPath.row].Brand)
      cell.SizeLabel.text = "Size: " + String(self.SwapArray[indexPath.row].Size)
        cell.LengthLabel.text = "Length: " + String(self.SwapArray[indexPath.row].length)
        cell.MaterialLabel.text = "Material: " + String(self.SwapArray[indexPath.row].fabric)
        cell.WashingPrfLabel.text = "Washing Preference: " + String(self.SwapArray[indexPath.row].washPref)
        cell.TypeOfFitLabel.text = "Style: " + String(self.SwapArray[indexPath.row].typOFit)
        cell.ColorLabel.text = "Color: " + String(self.SwapArray[indexPath.row].Color)
      

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
