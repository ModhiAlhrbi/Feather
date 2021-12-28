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
    
}






