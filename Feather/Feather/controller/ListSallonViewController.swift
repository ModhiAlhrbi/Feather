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
        
        Salon(name: "Beautysecretc", desc: "", imgListSalone: UIImage(named: "newBEUTY##")!, services: []),
        Salon(name: "SWAN", desc: "desc", imgListSalone: UIImage(named: "newSWAN##")!, services: []),
        Salon(name: "CATAN", desc: "desc", imgListSalone: UIImage(named: "newCATAN##")!, services: []),
        Salon(name: "+FOGA+⁩", desc: "desc", imgListSalone: UIImage(named: "newFOGA##")!, services: []),
        Salon(name: "Peerly Care", desc: "desc", imgListSalone: UIImage(named: "newPERLYCARE##")!, services: []),
        Salon(name: "AntiAgmal", desc: "desc", imgListSalone: UIImage(named: "newANTIAGMAL##")!, services: []),

    ]
    
    var arrBeautysecretc = ["collictionBeautysecretc1","collictionBeautysecretc2","collictionBeautysecretc3","collictionBeautysecretc4","collictionBeautysecretc5","collictionBeautysecretc6"]
    
    var arrPhotoCatan = ["collictionCATAN-1","collictionCATAN2","collictionCATAN3","collictionCATAN4"]
    
    var arrPhotoSwan = ["collictionSWAN1","collictiponSWAN2","collictionSWAN3","collictionSWAN4"]
    
    var arrPhotoPearlyCare = ["collictionPERLY1","collictionPERLY2","collictionPERLY3"]
    
    var arrPhotoAntiAgmal = ["collictionANTIAGMAL1","collictionANTIAGMAL2","Foga3"]
    
    
    var arrPhotoFoga = ["Foga1","Foga2","Foga3","Foga4","Foga5"]
    
    
    var PickerBeautysecretc:[String:Double] = [
                    
        "Pedicure 150 SR".localized : 150  ,
        "Manicure 200 SR".localized : 200 ,
        "Skin cleaning 150 SR".localized : 150,
        "Massage 220 SR".localized : 220 ,
        "Makeup 250 SR".localized : 250 ]
    
    var PickerCatan: [String : Double] = [
        "Pedicure 100 SR".localized : 100  ,
        "Manicure 200 SR".localized : 200 ,
        "Skin cleaning 200 SR".localized : 90 ,
        "Massage 220 SR".localized : 220 ,
        "Makeup 250 SR".localized : 250 ]
    
    var PickerSwan: [String : Double] = [
        "Pedicure 100  SR".localized : 100  ,
        "Manicure 150 SR".localized : 150 ,
        "Skin cleaning 90 SR".localized : 90 ,
        "Massage 220 SR".localized : 220 ,"Makeup 250 SR".localized : 250 ]
    
    
    var PickerPearlyCare: [String : Double] = [
        "Pedicure 120 SR".localized : 100  ,
        "Manicure 150 SR".localized : 150 ,
        "Skin cleaning 150 SR".localized : 150 ,
        "Massage 220 SR".localized : 220 ,
        "Makeup 300 SR".localized : 300 ]
    
    
    var PickerAntiAgmal: [String : Double] = [
        "Pedicure  80 SR".localized : 80  ,
        "Manicure 60 SR" .localized: 60 ,
        "Skin cleaning 70 SR".localized : 70 ,
        "Massage 120 SR".localized : 120 ,
        "Makeup 120 SR".localized : 120 ]
    
    var PickerFoga: [String : Double] = [
        "Pedicure 180 SR".localized : 180  ,
        "Manicure 200 SR".localized : 200 ,
        "Skin cleaning 200 SR".localized : 200 ,
        "Massage 250 SR" .localized: 250 ,
        "Makeup 250 SR".localized : 250 ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateServices()
        tableViewList.delegate = self
        tableViewList.dataSource = self
        self.title = "Sallons List".localized
        
    }
    
    
    
    func populateServices(){
        
        
        
        let makeupBeautysecretc = Service(nameService: "Makeup".localized, description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 200, subServices: SubServices(images: arrBeautysecretc, subServices: PickerBeautysecretc))
        
        let makeupCatan = Service(nameService: "Makeup".localized, description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 200, subServices: SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        let makeupSwan = Service(nameService: "Makeup".localized, description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 250,subServices: SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        let makeupPerlyCare = Service(nameService: "Makeup".localized, description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 250, subServices: SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        let makeupAntiAgmal = Service(nameService: "Makeup".localized, description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 150, subServices: SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        let makeupFoga = Service(nameService: "Makeup".localized, description: "", imgServicePhoto: UIImage(named: "makeup1")!, price: 250, subServices: SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        
        let massageBeautysecretc = Service(nameService: "Massage".localized, description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 250, subServices: SubServices(images: arrBeautysecretc, subServices: PickerBeautysecretc))
        
        
        let massageCatan = Service(nameService: "Massage".localized, description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 250,subServices:SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        
        let massageSwan = Service(nameService: "Massage".localized, description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 230, subServices: SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        
        let massagePerlyCare = Service(nameService: "Massage".localized, description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 350, subServices: SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        
        let massageAntiAgmal = Service(nameService: "Massage".localized, description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 150, subServices: SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        
        let massageFoga = Service(nameService: "Massage".localized, description: "", imgServicePhoto: UIImage(named: "Massage1")!, price: 250, subServices: SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        
        let manicureBeautysecretc = Service(nameService: "Manicure".localized, description: "", imgServicePhoto: UIImage(named: "manicure2")!, price:200, subServices: SubServices(images: arrBeautysecretc, subServices: PickerBeautysecretc))
        
        let manicureCatan = Service(nameService: "Manicure".localized, description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 200 ,subServices:SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        let manicureSwan = Service(nameService: "Manicure".localized, description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 200 ,subServices:SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        let manicurePerlyCare = Service(nameService: "Manicure".localized, description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 180 ,subServices:SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        let manicureAntiAgmal = Service(nameService: "Manicure".localized, description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 60 ,subServices:SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        let manicureFoga = Service(nameService: "Manicure".localized, description: "", imgServicePhoto: UIImage(named: "manicure2")!, price: 150 ,subServices:SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        let pedicureBeautysecretc = Service(nameService: "Pedicure".localized, description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 150,subServices:SubServices(images: arrBeautysecretc, subServices: PickerBeautysecretc))
        
        
        let pedicureCatan = Service(nameService: "Pedicure".localized, description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 150,subServices:SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        let pedicureSwan = Service(nameService: "Pedicure".localized, description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 200,subServices:SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        let pedicurePerlyCare = Service(nameService: "Pedicure".localized, description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 150,subServices:SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        let pedicureAntiAgmal = Service(nameService: "Pedicure".localized, description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 80,subServices:SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        
        let pedicureFoga = Service(nameService: "Pedicure".localized, description: "des", imgServicePhoto: UIImage(named: "pedicure1")!, price: 200,subServices:SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        let skinCleaningBeautysecretc = Service(nameService: "Skin cleaning".localized, description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price:200,subServices:SubServices(images: arrBeautysecretc, subServices: PickerBeautysecretc))
        
        
        
        let skinCleaningCatan = Service(nameService: "Skin cleaning".localized, description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoCatan, subServices: PickerCatan))
        
        
        let skinCleaningSwan = Service(nameService: "Skin cleaning".localized, description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoSwan, subServices: PickerSwan))
        
        
        
        let skinCleaningPerlyCare = Service(nameService: "Skin cleaning".localized, description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoPearlyCare, subServices: PickerPearlyCare))
        
        
        let skinCleaningAntiAgmal = Service(nameService: "Skin cleaning".localized, description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoAntiAgmal, subServices: PickerAntiAgmal))
        
        
        let skinCleaningFoga = Service(nameService: "Skin cleaning".localized, description: "des", imgServicePhoto: UIImage(named: "Skin cleaning1")!, price: 150,subServices:SubServices(images: arrPhotoFoga, subServices: PickerFoga))
        
        
        
        arrListSaloon[0].services = [makeupBeautysecretc,massageBeautysecretc,manicureBeautysecretc,pedicureBeautysecretc,skinCleaningBeautysecretc]
        arrListSaloon[1].services = [makeupSwan,pedicureSwan,manicureSwan, massageSwan,skinCleaningSwan]
        arrListSaloon[2].services = [makeupCatan,skinCleaningCatan,pedicureCatan,manicureCatan,massageCatan]
        arrListSaloon[3].services = [makeupFoga,pedicureFoga,manicureFoga,massageFoga,skinCleaningFoga]
        arrListSaloon[4].services =  [pedicurePerlyCare,manicurePerlyCare,massagePerlyCare,skinCleaningPerlyCare]
        arrListSaloon[5].services = [makeupAntiAgmal,massageAntiAgmal,pedicureAntiAgmal,manicureAntiAgmal,skinCleaningAntiAgmal]
        
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
        return (tableView.frame.width / photoSizeRatio) 
    }
}

extension String {
    
    var localized : String {
        return NSLocalizedString(self, comment: "")
    }
    
}
