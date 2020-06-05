//
//  LoginViewController.swift
//  Weather
//
//  Created by Ivan Sebastian on 05/06/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseAuth

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be retracted
    }
    

    @IBAction func signInTapped(_ sender: UIButton) {
        
          // Get the default auth object
            let authUI = FUIAuth.defaultAuthUI()
            
            guard authUI != nil else {
            // Log the Error
            return
            }
            
            // Set ourselves as the delegate
        authUI?.delegate = self
            
            // Get a reference to be the auth UI view controller
        let authVC = authUI!.authViewController()
            
            // Show it
        present(authVC, animated: true, completion: nil)
    }
  

}

extension LoginViewController: FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        if error != nil{
            // Log error
            return
        }
        
        //authDataResult.user.uid
        
        performSegue(withIdentifier: "goHome", sender: self)
    } 
}
