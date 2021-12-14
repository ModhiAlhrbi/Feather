//
//  OrderTableViewController.swift
//  Feather
//
//  Created by موضي الحربي on 10/05/1443 AH.
//

import UIKit
import CoreData

class OrderTableViewController: UITableViewController {

    
    var orders : [Order] = []
    var persntenContiner : NSPersistentContainer = {
        let contner = NSPersistentContainer(name: "Feather")
        contner.loadPersistentStores(completionHandler: { des, error in
            if let error = error {
                print(error)
            }
            
        })
        return contner
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    override func viewWillAppear(_ animated: Bool) {
        fetchOrders()
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orders.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)

        cell.textLabel?.text = orders[indexPath.row].serviceName
        
        cell.detailTextLabel?.text = orders[indexPath.row].date?.formatted()
        return cell
    }
   

    func fetchOrders (){
       
        let contstn = persntenContiner.viewContext
      
        do {
        orders = try contstn.fetch(Order.fetchRequest())
            
        } catch {
           print(error)
        }
        
    }
    
    
    
    
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
