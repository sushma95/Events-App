//
//  EventCell.swift
//  EventsApp
//
//  Created by Student on 2/27/20.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI

class EventCell: PFTableViewCell {
    
    @IBOutlet weak var eventImage: PFImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
}
