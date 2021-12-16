//
//  ServiceViewController.swift
//  Feather
//
//  Created by موضي الحربي on 03/05/1443 AH.
//

import UIKit

class ServiceViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    
    var selctedService : Service?
    
    var selectedSalon : Salon!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSalon.services.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selctedService = selectedSalon.services[indexPath.row]
        performSegue(withIdentifier: "salonPhotosCell", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "salonPhotosCell" {
            let destination = segue.destination as! SallonPhotosViewController
            destination.selctedService = selctedService
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell") as! ServisesTableViewCell
        
        cell.imgServicePhoto.image = selectedSalon.services[indexPath.row].imgServicePhoto
        cell.lablelService.text = selectedSalon.services[indexPath.row].nameService
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let photo = selectedSalon.services[indexPath.row].imgServicePhoto
        
        let photoWidthRatio = photo.size.width / photo.size.height
        return tableView.frame.width / photoWidthRatio
    }
    
    
    
    
    
}

