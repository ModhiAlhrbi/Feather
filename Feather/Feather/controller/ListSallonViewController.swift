//
//  ListSallonViewController.swift
//  Feather
//
//  Created by موضي الحربي on 10/05/1443 AH.
//

import UIKit

class ListSallonViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewList: UITableView!
    
    
    var selectedSalon : Salon!
    
    var arrListSaloon : [Salon] = [
        Salon(name: "CATAN", desc: "desc", imgListSalone: UIImage(named: "S-CATAN")!, services: []),
        Salon(name: "SWAN", desc: "desc", imgListSalone: UIImage(named: "S-SWAN")!, services: []),
        Salon(name: "Peerly Care", desc: "desc", imgListSalone: UIImage(named: "S-peerly Care")!, services: []),
        Salon(name: "AntiAgmal", desc: "desc", imgListSalone: UIImage(named: "S-AntiAgmal")!, services: []),
        Salon(name: "FOGA", desc: "desc", imgListSalone: UIImage(named: "S-FOGA")!, services: [])
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateServices()
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        
    }
    
    
    
    func populateServices(){
        
        let makeup = Service(nameService: "Makeup", description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 200, subServices: SubServices(images: arrPhotoCatan, subServices: <#T##[String : Double]#>))
        
        
        let massage = Service(nameService: "Massage", description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 220,subServices:SubServices(images: arrPhotoSwan, subServices: <#T##[String : Double]#>))
        
        
        
        let manicure = Service(nameService: "Manicure", description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 100 ,subServices:SubServices(images: arrPhotoPearlyCare, subServices: <#T##[String : Double]#>))
        
        
        let pedicure = Service(nameService: "Pedicure", description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 90,subServices:SubServices(images: arrPhotoAntiAgmal, subServices: <#T##[String : Double]#>))
        
        
        let skinCleaning = Service(nameService: "Skin cleaning", description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoFoga, subServices: <#T##[String : Double]#>))
        
        
        arrListSaloon[0].services = [skinCleaning,pedicure,manicure,massage]
        arrListSaloon[1].services = [makeup,pedicure,manicure, massage]
        arrListSaloon[2].services = [pedicure,manicure,massage]
        arrListSaloon[3].services = [makeup,pedicure,manicure]
        arrListSaloon[4].services = [makeup,pedicure,manicure,massage]
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrListSaloon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"salonListCell") as!
        ListSallonTableViewCell
        
        cell.imgListSallon.image = arrListSaloon[indexPath.row].imgListSalone
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSalon = arrListSaloon[indexPath.row]
        performSegue(withIdentifier: "serviceList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "serviceList" {
            
            let dest = segue.destination as! ServiceViewController
            dest.selectedSalon = selectedSalon
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let photo = arrListSaloon[indexPath.row].imgListSalone
        let photoSizeRatio = photo.size.width / photo.size.height
        return tableView.frame.width / photoSizeRatio
    }
}
