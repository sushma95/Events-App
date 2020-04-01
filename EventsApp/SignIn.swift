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
            
    
     override func viewDidAppear(_ animated: Bool) {
           self.navigationController?.isNavigationBarHidden = true
           let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
           backgroundImage.image = UIImage(named: "northwestmissouri.jpg")
           backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
           self.view.insertSubview(backgroundImage, at: 0)
        
        
             /* let currentUser = PFUser.current()
              if currentUser != nil {
                  loadHomeScreen()
              }*/
          }
    
    
    

          override func didReceiveMemoryWarning() {
              super.didReceiveMemoryWarning()
              // Dispose of any resources that can be recreated.
          }

          func loadHomeScreen(){
            self.performSegue(withIdentifier: "mySegueIdentifier", sender: nil)
             /* let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
              let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "TAB") as! UITabBarController
           
           navigationController?.pushViewController(loggedInViewController, animated: true)*/
            
          // loggedInViewController.modalPresentationStyle = .fullScreen
            //  self.present(loggedInViewController, animated: true, completion: nil)
          }
       
      


           @IBAction func signIn(_ sender: UIButton) {

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
       @IBAction func signUp(_ sender: UIButton) {
           
           let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let signUpVC = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
           //signUpVC.modalPresentationStyle = .fullScreen
           
           
              //    self.present(signUpVC, animated: true, completion: nil)
           
           navigationController?.pushViewController(signUpVC, animated: true)
              
           }

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
