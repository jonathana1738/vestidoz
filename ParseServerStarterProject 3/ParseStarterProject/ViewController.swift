/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController,  UITextFieldDelegate {
var signupMode = true
    var activityIndicator = UIActivityIndicatorView()
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passWordTextField: UITextField!
    @IBOutlet var signUpOrLoginOutlet: UIButton!
    
    func createAlert(title:String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func signUpOrLogInButton(_ sender: Any) {
        
        if emailTextField.text == "" || passWordTextField.text == ""{
            
            createAlert(title: "Error in Form", message: "Please enter an email or password")
        }else{
            
                activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                activityIndicator.center = self.view.center
                activityIndicator.hidesWhenStopped = true
                activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
                view.addSubview(activityIndicator)
                activityIndicator.startAnimating()
                UIApplication.shared.beginIgnoringInteractionEvents()
                
            
            if signupMode{
                // sign up
                let user = PFUser()
                user.username = emailTextField.text
                user.email = emailTextField.text
                user.password = passWordTextField.text
                user.signUpInBackground(block: { (success, error) in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    
                    
                    if error != nil{ // if there is an error
                        
                        let error = error as NSError?
                        var displayErrorMessage = "Please try Again later.."
                        
                        //
                        
                        if let errorMessage = error?.userInfo["error"] as? String{
                            displayErrorMessage = errorMessage
                        }
                        self.createAlert(title: "Signup Error", message: displayErrorMessage)
                    }else{
                        // there isn't an error
                        print("user Signed up")
                    }
                })
                
            }else{
                // Log in Mode
                PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passWordTextField.text!, block: { (user, error) in
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    if error != nil{
                        
                        let error = error as NSError?
                        var displayErrorMessage = "Please try Again later."
                        if let errorMessage = error?.userInfo["error"] as? String{
                            displayErrorMessage = errorMessage
                        }
                        self.createAlert(title: "Log In Error", message: displayErrorMessage)
                        
                    }else{
                        // if no error
                        print("logged in")
                        
                    }
                })
                
            }
        }
        
        
        
        print("sign up mode")
    }
    @IBOutlet var changeSignUpModeOutlet: UIButton!
    
    @IBAction func changeSignUpModeButton(_ sender: Any) {
        if signupMode {
            //change to log in mode
            signUpOrLoginOutlet.setTitle("Log In", for: [])
            changeSignUpModeOutlet.setTitle("Sign Up", for: [])
            messageLabel.text = "Don't have an account?"
            signupMode = false
        }else{
            
           // change to sign up mode
            signUpOrLoginOutlet.setTitle("Sign Up", for: [])
            changeSignUpModeOutlet.setTitle("Log In", for: [])
            messageLabel.text = "Already have an account?"
            signupMode = true
        }
        
        
        
    }
    
    
    @IBOutlet var messageLabel: UILabel!
    
    
   
    
    

    

    
  
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        return true
    }
   
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
         self.emailTextField.delegate = self
        self.passWordTextField.delegate = self
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
