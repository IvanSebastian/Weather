//
//  LoginViewController.swift
//  Weather
//
//  Created by Ivan Sebastian on 05/06/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElement()
    
    }

    func setupElement(){
        
        //Hide error label
        errorLbl.alpha = 0
        signInBtn.layer.cornerRadius = 5
        passTxt.isSecureTextEntry = true
        
        
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        
        let email = emailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            //user failed sign in
            if error != nil {
                self.errorLbl.text = error!.localizedDescription
                self.errorLbl.alpha = 1
            }else{
                //user success sign in
                self.transitionHome()
            }
        }
        
    }
    
    func transitionHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeVC) as? HomeViewController
        
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }

    
}


