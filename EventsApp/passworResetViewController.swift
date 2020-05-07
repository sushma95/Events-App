//
//  passworResetViewController.swift
//  EventsApp
//
//  Created by Student on 5/6/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import Parse

class passworResetViewController: UIViewController {
    
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var imageViewPassword: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewPassword.image = UIImage(named: "forgot-password.png")
        emailAddressTextField.inputView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //This method is used for reset password in events page.
    
    @IBAction func sendButtontapped(_ sender: AnyObject) {
        
        let emailAdress = emailAddressTextField.text
        if emailAdress?.isEmpty ?? true{
            
            return
        }
        
        
        PFUser.requestPasswordResetForEmail(inBackground: self.emailAddressTextField.text!)
        
        let alert = UIAlertController(title: nil, message: "Your password has been sent to your email address.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //This is used to cancel the page and go back to sign in page.
    
    @IBAction func cancelButtontapped(_ sender: AnyObject) {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! SignIn
        navigationController?.pushViewController(signInVC, animated: true)
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
