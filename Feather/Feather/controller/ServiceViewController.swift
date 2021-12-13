//
//  ServiceViewController.swift
//  Feather
//
//  Created by موضي الحربي on 03/05/1443 AH.
//

import UIKit

class ServiceViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    
    var selctedService : Service?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let arrServices = [
        Service(nameService: "Pedicure", imgServicePhoto: UIImage(named: "pedicure1")!),
        Service(nameService: "Manicure", imgServicePhoto: UIImage(named: "manicure2")!),
        Service(nameService: "Skin cleaning", imgServicePhoto: UIImage(named: "Skin cleaning1")!),
        Service(nameService: "Massage", imgServicePhoto: UIImage(named: "Massage1")!),
        Service(nameService: "Makeup", imgServicePhoto: UIImage(named: "makeup1")!)
    ]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrServices.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selctedService = arrServices[indexPath.row]
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
        
        cell.imgServicePhoto.image = arrServices[indexPath.row].imgServicePhoto
        cell.lablelService.text = arrServices[indexPath.row].nameService
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let photo = arrServices[indexPath.row].imgServicePhoto
        
        let photoWidthRatio = photo.size.width / photo.size.height
        return tableView.frame.width / photoWidthRatio
    }
    
    
    
    
    
}

