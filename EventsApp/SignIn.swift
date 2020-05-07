//
//  ViewController.swift
//  EventsApp
//
//  Created by Student on 2/26/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class SignIn: UIViewController {
    @IBOutlet fileprivate var signInUsernameField: UITextField!
    @IBOutlet fileprivate var signInPasswordField: UITextField!
    @IBOutlet weak var imageViewLogin: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        imageViewLogin.image = UIImage(named: "nwlogin")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadHomeScreen(){
        self.performSegue(withIdentifier: "mySegueIdentifier", sender: nil)
    }
    
    
    
    // This function is about sigin of the username and password if credentials are wrong it displays an error  
    @IBAction func signInBTN(_ sender: UIButton) {
        
        let sv = UIViewController.displaySpinner(onView: self.view)
        PFUser.logInWithUsername(inBackground: signInUsernameField.text!, password: signInPasswordField.text!) { (user, error) in
            UIViewController.removeSpinner(spinner: sv)
            if user != nil {
                self.loadHomeScreen()
            }else{
                if let descrip = error?.localizedDescription{
                    self.displayErrorMessage(message: (descrip))
                }
            }
        }
    }
    
    
    // This  function is about signup when user dont register and it gets the signup page
    @IBAction func signUpBTN(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
    
    //This function is about password reset and it displays the passwordReset Page
    @IBAction func PasswordReset(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resetPasswordVC = storyBoard.instantiateViewController(withIdentifier: "passworResetViewController") as! PasswordResetViewController
        navigationController?.pushViewController(resetPasswordVC, animated: true)
        
    }
    
    // This function display the error message
    func displayErrorMessage(message:String) {
        let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        }
        alertView.addAction(OKAction)
        if let presenter = alertView.popoverPresentationController {
            presenter.sourceView = self.view
            presenter.sourceRect = self.view.bounds
        }
        self.present(alertView, animated: true, completion:nil)
    }
    
}
