//
//  PostViewController.swift
//  DresSwapMvp
//
//  Created by Jonathan on 3/18/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse
var choosingFrontImage = false
var choosingBackImage = false


class PostViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet var FchosenPic: UIImageView!
   var activityIndicator = UIActivityIndicatorView()
    
    @IBOutlet var BchosenPic: UIImageView!
    
   
    @IBAction func BackImageButton(_ sender: Any) {
        choosingBackImage = true
        let BimagePicker = UIImagePickerController()
       BimagePicker.delegate = self
        BimagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        BimagePicker.allowsEditing = false
        self.present(BimagePicker, animated: true, completion: nil)

    }
   
    @IBAction func FrontImageButton(_ sender: Any) {
        choosingFrontImage = true
        let FimagePicker = UIImagePickerController()
        FimagePicker.delegate = self
        FimagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        FimagePicker.allowsEditing = false
        self.present(FimagePicker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if  let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            if choosingFrontImage{
                FchosenPic.image = image
            }
            if choosingBackImage {
                BchosenPic.image = image
            }
        }
        
        choosingFrontImage = false
        choosingBackImage = false
        
        self.dismiss(animated: true, completion: nil)
    }

   
    
    @IBOutlet var BrandTextField: UITextField!
    
    @IBOutlet var SizeTextField: UITextField!
    
    @IBOutlet var LengthTextField: UITextField!
    
    @IBOutlet var ColorTextField: UITextField!
    @IBOutlet var FitTextField: UITextField!
    @IBOutlet var FabricTextField: UITextField!
    @IBOutlet var WashingPrefTextField: UITextField!
    
    
    func createAlert(title:String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
           alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

    
    
    
    @IBAction func PostButton(_ sender: Any) {
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        //
        
        let post = PFObject (className: "Posts")
      //  post["email Address"] =
        post["userID"] = PFUser.current()?.objectId!
        post ["Brand"] = BrandTextField.text
        post["Size"] = SizeTextField.text
        post["Length"] = LengthTextField.text
        post["Color"] = ColorTextField.text
        post["Fit"] = FitTextField.text
        post["Fabric"] = FabricTextField.text
        post["WashingPrfrnce"] = WashingPrefTextField.text
        let FrontImageData = UIImageJPEGRepresentation(self.FchosenPic.image!, 0.5)
        let BackImageData = UIImageJPEGRepresentation(self.BchosenPic.image!, 0.5)
        let FrontImageFile = PFFile(name: "frontImg.png", data: FrontImageData!)
        let BackImageFile = PFFile(name: "BackImg.png", data: BackImageData!)
        post["FrontImage"] = FrontImageFile
         post["BackImage"] = BackImageFile
        post.saveInBackground { (success, error) in
            self.activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            if error != nil{
                self.createAlert(title: "Could not post image", message: "Please try again later")
            }else{
                self.createAlert(title: "Image Posted!", message: "Your image has been posted successfully")
                self.BrandTextField.text = ""
                self.SizeTextField.text = ""
                self.LengthTextField.text = ""
                self.ColorTextField.text = ""
                self.FitTextField.text = ""
                self.FabricTextField.text = ""
                self.WashingPrefTextField.text = ""
                self.FchosenPic.image = UIImage(named: "frnt")
                self.BchosenPic.image = UIImage(named: "nBack")
                  
            }
        }
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.BrandTextField.delegate = self
        self.SizeTextField.delegate = self
        self.LengthTextField.delegate = self
        self.ColorTextField.delegate = self
        self.FitTextField.delegate = self
        self.FabricTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
