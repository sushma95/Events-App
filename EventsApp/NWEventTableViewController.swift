////
////  RestaurantsTableViewController.swift
////  EventsApp
////
////  Created by Student on 2/27/20.
////  Copyright © 2020 Student. All rights reserved.
////
//
//import UIKit
//
//class NWEventTableViewController: UITableViewController {
//
//       
//    required init?(coder: NSCoder) {
//        super.init(coder:coder)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.hidesBackButton = true
//        navigationItem.title = "Events"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "AddEvent", style: .done, target: self, action: #selector(add))
//        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LogOut", style: .done, target: self, action: #selector(logout))
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(eventadded), name: NSNotification.Name(rawValue: "Added"), object: nil)
//
//         }
//    
//    @objc func logout(){
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! SignIn
//         
//         navigationController?.pushViewController(loggedInViewController, animated: true)
//        // loggedInViewController.modalPresentationStyle = .fullScreen
//    }
//    
//    @objc func add(){
//        
//         let addVC = storyboard?.instantiateViewController(identifier: "AdEventViewController") as! AdEventViewController
//            
//            navigationController?.pushViewController(addVC, animated: true)
//        
//    }
//    
// 
//    
//    @objc func eventadded(notification: Notification){
//        tableView.reloadData()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.reloadData()
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Events.shared.numEvents()
//    }
//
//    let nameLBLTag = 100
//    let ratingLBLTag = 200
//    let venueLBLTag = 300
//
//    
//    let optimalRowHeight:CGFloat = 120
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return optimalRowHeight
//    }
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//    // Delete the row from the data source
//       Events.shared.delete(at:indexPath.row)
//    tableView.deleteRows(at: [indexPath], with: .fade)
//    } else if editingStyle == .insert {
//    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        if let event = Events.shared[indexPath.row] {
//            let nameLBL = cell.viewWithTag(nameLBLTag) as! UILabel
//            let dateLBL = cell.viewWithTag(ratingLBLTag) as! UILabel
//            
//             let venueLBL = cell.viewWithTag(venueLBLTag) as! UILabel
//            
//            nameLBL.text = "Event Name : \(event.name)"
//            dateLBL.text = "Date : \(event.date)"
//            venueLBL.text = "Venue : \(event.venue)"
//            
//            
//            
//        }
//        return cell
//    }
//    
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    
//    // Override to support editing the table view.
//    
//    
//
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
