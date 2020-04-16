//
//  AddEventViewController.swift
//  EventsApp
//
//  Created by Student on 3/6/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

import Parse
import ParseUI

class AddEventViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var priceLabel: UITextField!
    
    @IBOutlet weak var dateLabel: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        datePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: UIControlEvents.valueChanged)
        
        dateFormat()
        
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        imageButton.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createEvent(_ sender: Any)
    
    {
        if let image = imageView.image {
        let name = PFObject(className: "Events")
                name["location"] = locationLabel.text
                name["price"] = priceLabel.text
                name["date"] = dateLabel.text
                name["name"] = nameLabel.text

        let imageData =  UIImagePNGRepresentation(self.imageView.image!)
                let parseImageFile = PFFileObject(name: "uploaded_image.png", data: imageData!)
                
                name["image"] = parseImageFile
                
                name.saveInBackground {
                    (success: Bool, error: Error?) -> Void in
                    
                    if (success) {
                        print("success")
                        
                    }else{
                        
                        print("error")
                        
                    }
                    
                    
                    
                }
                
                
                name.saveInBackground {
                    (success: Bool, error: Error?) -> Void in
                    
                    if (success) {
                        
                        
                    }else {
                        
                    }
                    
                }
                
        }
        if nameLabel.text!.count > 0 && locationLabel.text!.count > 0 && priceLabel.text!.count > 0{
            let alert = UIAlertController(title: "Event created successfully", message: "please view in event page", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))


            self.present(alert, animated: true)
            nameLabel.text!=""
            locationLabel.text!=""
            priceLabel.text!=""
        }
        else {
            let alert = UIAlertController(title: "Please enter all details", message: "", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))


            self.present(alert, animated: true)
        }
        
            }
            

            
            func dateFormat() {
                
                let dateFormatter = DateFormatter()
                let short = DateFormatter.Style.short
                dateFormatter.dateStyle = short
                dateFormatter.timeStyle = short
                dateFormatter.dateFormat = "MM/dd/YY hh:mm a"
                
                let strDate = dateFormatter.string(from: datePicker.date)
                
                dateLabel.text = strDate
                
                
            }
            
            @objc func datePickerChanged(datePicker:UIDatePicker) {
                
                dateFormat()
            }
            

            
    
    
    @IBAction func loadImage(_ sender: Any) {
        
        imageButton.isHidden = true
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
                
                if let pickedImage = info[UIImagePickerControllerOriginalImage] as?
                
                    UIImage {
                    
                    imageView.contentMode = .scaleAspectFit
                    
                    imageView.image = pickedImage
                }
                
                dismiss(animated: true, completion: nil)
                
                
            }
            
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                dismiss(animated: true, completion: nil)
            }



        }
