//
//  Extensions.swift
//  EventsApp
//
//  Created by Student on 2/26/20.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation
import UIKit

//This is the extension for view controller which is used for spinning at the background.
extension UIViewController {
    
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let animation = UIActivityIndicatorView.init(activityIndicatorStyle: .large)
        animation.startAnimating()
        animation.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(animation)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
