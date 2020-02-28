//
//  AddEventViewController.swift
//  EventsApp
//
//  Created by Student on 2/27/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class AdEventViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
        
        @IBOutlet weak var dateTF: UITextField!
    
    @IBOutlet weak var venueTF: UITextField!
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }

        
        @IBAction func addTapped(_ sender: Any) {
            
            let name = nameTF.text!
            let date = dateTF.text!
            let place = venueTF.text!
            
           
            
            let event = Event(name: name, date : date, venue: place)
            Events.shared.add(event: event)
            
            
            let addVC = storyboard?.instantiateViewController(identifier: "NWEventTableViewController") as! NWEventTableViewController
                      
                      navigationController?.pushViewController(addVC, animated: true)
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
