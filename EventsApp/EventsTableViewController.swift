//
//  EventsTableViewController.swift
//  EventsApp
//
//  Created by Student on 2/27/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class EventsTableViewController: PFQueryTableViewController {
 let optimalRowHeight:CGFloat = 200
    override func queryForTable() -> PFQuery<PFObject> {
        let query = PFQuery(className: "Events")
        //query.order(byAscending: "location")
        query.order(byAscending: "date")
        return query
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Events"
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "logout", style: .done, target: self, action: #selector(logout))
    }
    
    @objc func logout(){
        
        let next = storyboard?.instantiateViewController(identifier: "SignIn") as! SignIn
        navigationController?.pushViewController(next, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return optimalRowHeight
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source
    
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
        
        cell.priceLabel.text = object?.object(forKey: "price") as? String
        cell.dateLabel.text = object?.object(forKey: "date") as? String
        cell.locationLabel.text = object?.object(forKey: "location") as? String
        cell.nameLabel.text = object?.object(forKey: "name") as? String
        
        let imageFile = object?.object(forKey: "image") as? PFFileObject
        
       
        
        cell.eventImage.file = imageFile
        cell.eventImage.loadInBackground()
        
        return cell
        
        
    }


  
    @IBAction func reloadTable(_ sender: Any) {
         self.loadObjects()
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
