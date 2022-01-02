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
        
        Salon(name: "SWAN", desc: "desc", imgListSalone: UIImage(named: "SWANSPA-")!, services: []),
        Salon(name: "CATAN", desc: "desc", imgListSalone: UIImage(named: "S-CATAN")!, services: []),
        Salon(name: "Peerly Care", desc: "desc", imgListSalone: UIImage(named: "S-peerly Care")!, services: []),
        Salon(name: "Beautysecretc", desc: "", imgListSalone: UIImage(named: "Beautysecretc")!, services: []),
       
        Salon(name: "AntiAgmal", desc: "desc", imgListSalone: UIImage(named: "S-AntiAgmal")!, services: []),
        Salon(name: "FOGA", desc: "desc", imgListSalone: UIImage(named: "S-FOGA")!, services: [])
        
    ]
    var arrBeautysecretc = ["","","",""]
    
    var arrPhotoCatan = ["collictionCATAN-1","collictionCATAN2","collictionCATAN3","collictionCATAN4"]
    
    var arrPhotoSwan = ["collictionSWAN1","collictiponSWAN2","collictionSWAN3","collictionSWAN4"]
    
    
    var arrPhotoPearlyCare = ["collictionPERLY1","collictionPERLY2","collictionPERLY3"]
    
    var arrPhotoAntiAgmal = ["collictionANTIAGMAL1","collictionANTIAGMAL2","Foga3"]
    
    
    var arrPhotoFoga = ["Foga1","Foga2","Foga3","Foga4","Foga5"]
    
    
    
    var PickerCatan: [String : Double] = ["Pedicure 100 SR" : 100  ,"Manicure 200 SR" : 200 ,"Skin cleaning" : 90 ,"Massage" : 220 ,"Makeup" : 250 ]
    
    var PickerSwan: [String : Double] = ["Pedicure" : 100  ,"Manicure" : 150 ,"Skin cleaning" : 90 ,"Massage" : 220 ,"Makeup" : 250 ]
    
    
    var PickerPearlyCare: [String : Double] = ["Pedicure 120 SR" : 100  ,"Manicure" : 150 ,"Skin cleaning" : 90 ,"Massage" : 220 ,"Makeup" : 250 ]
    
    
    var PickerAntiAgmal: [String : Double] = ["Pedicure" : 100  ,"Manicure" : 150 ,"Skin cleaning" : 90 ,"Massage" : 220 ,"Makeup" : 250 ]
    
    var PickerFoga: [String : Double] = ["Pedicure" : 100  ,"Manicure" : 150 ,"Skin cleaning" : 90 ,"Massage" : 220 ,"Makeup" : 250 ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateServices()
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        
    }
    
    
    
    func populateServices(){
        
        let makeupCatan = Service(nameService: "Makeup", description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 200, subServices: SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        
        let makeupSwan = Service(nameService: "Makeup", description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 250,subServices: SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        let makeupPerlyCare = Service(nameService: "Makeup", description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 250, subServices: SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        let makeupAntiAgmal = Service(nameService: "Makeup", description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 150, subServices: SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        let makeupFoga = Service(nameService: "Makeup", description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 250, subServices: SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        
        
        let massageCatan = Service(nameService: "Massage", description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 250,subServices:SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        
        let massageSwan = Service(nameService: "Massage", description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 230, subServices: SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        
        let massagePerlyCare = Service(nameService: "Massage", description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 350, subServices: SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        
        let massageAntiAgmal = Service(nameService: "Massage", description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 150, subServices: SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        
        let massageFoga = Service(nameService: "Massage", description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 250, subServices: SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        
        
        let manicureCatan = Service(nameService: "Manicure", description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 200 ,subServices:SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        let manicureSwan = Service(nameService: "Manicure", description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 200 ,subServices:SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        
        
        let manicurePerlyCare = Service(nameService: "Manicure", description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 180 ,subServices:SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        
        let manicureAntiAgmal = Service(nameService: "Manicure", description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 60 ,subServices:SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        
        
        let manicureFoga = Service(nameService: "Manicure", description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 150 ,subServices:SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        
        
        
        let pedicureCatan = Service(nameService: "Pedicure", description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 150,subServices:SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        let pedicureSwan = Service(nameService: "Pedicure", description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 200,subServices:SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        let pedicurePerlyCare = Service(nameService: "Pedicure", description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 150,subServices:SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        let pedicureAntiAgmal = Service(nameService: "Pedicure", description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 80,subServices:SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        
        let pedicureFoga = Service(nameService: "Pedicure", description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 200,subServices:SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        
        
        let skinCleaningCatan = Service(nameService: "Skin cleaning", description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        let skinCleaningSwan = Service(nameService: "Skin cleaning", description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        
        let skinCleaningPerlyCare = Service(nameService: "Skin cleaning", description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        let skinCleaningAntiAgmal = Service(nameService: "Skin cleaning", description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        let skinCleaningFoga = Service(nameService: "Skin cleaning", description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        
        
        
        
        arrListSaloon[0].services = [makeupSwan,pedicureSwan,manicureSwan, massageSwan,skinCleaningSwan]
        arrListSaloon[1].services = [makeupCatan,skinCleaningCatan,pedicureCatan,manicureCatan,massageCatan]
        arrListSaloon[2].services = [pedicurePerlyCare,manicurePerlyCare,massagePerlyCare,skinCleaningPerlyCare]
        arrListSaloon[3].services = [makeupAntiAgmal,massageAntiAgmal,pedicureAntiAgmal,manicureAntiAgmal,skinCleaningAntiAgmal]
        arrListSaloon[4].services = [makeupFoga,pedicureFoga,manicureFoga,massageFoga,skinCleaningFoga]
        
        
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
