//
//  SIgnUpViewController.swift
//  EventsApp
//
//  Created by Student on 2/27/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class SignUpViewController: UIViewController {
    @IBOutlet fileprivate var registerUsernameField: UITextField!
    
    @IBOutlet fileprivate var registerPasswordField: UITextField!
    
  
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {        
        let user = PFUser()
                   user.username = registerUsernameField.text
                   user.password = registerPasswordField.text
                   let sv = UIViewController.displaySpinner(onView: self.view)
                   user.signUpInBackground { (success, error) in
                       UIViewController.removeSpinner(spinner: sv)
                       if success{
                           self.loadHomeScreen()
                       }else{
                           if let descrip = error?.localizedDescription{
                               self.displayErrorMessage(message: descrip)
                           }
                       }
                   }
    }
    
    
    func loadHomeScreen(){
             let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "NWEventTableViewController") as! NWEventTableViewController
                     
                     navigationController?.pushViewController(loggedInViewController, animated: true)
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

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
