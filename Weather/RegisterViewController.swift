//
//  RegisterViewController.swift
//  Weather
//
//  Created by Ivan Sebastian on 05/06/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElement()
        
    }
    
    
    
    
    func setupElement(){
        //Hide error label
        errorLbl.alpha = 0
        signUpBtn.layer.cornerRadius = 5
        
        
        
    }
  
    func validateFields() -> String?  {
        
        //check field
        if usernameField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" || emailTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill the fields"
        }
        
        //check password
        let checkPassword = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Style.isPasswordValid(checkPassword) == false{
            return "Please insert your password at least 8 characters, contains a special character and a number."
        }
        
        return nil
        
    }
    
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        //validate
        let error = validateFields()
        
        if error != nil {
            
            //show error message
            showError(error!)
            
        }else{
            let username = usernameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                //check error
                if error != nil {
                   
                    // Error when create user
                    self.showError("Error creating user")
                }else {
                    // User Created success, and store the username
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["username":username, "uid": result!.user.uid ]) { (error) in
                        
                        print("saved")
                        if error != nil{
                            //show error message
                            self.showError("Error Saving")
                        }
                    }
                }
            }
              
            // Transition to home view controller
            self.transitionHome()
        }
        
    }
    
    func showError(_ message:String){
        errorLbl.alpha = 1
    }
    
    func transitionHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeVC) as? HomeTableViewController
        
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
}
