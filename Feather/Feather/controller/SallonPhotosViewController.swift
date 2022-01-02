//
//  SallonPhotosViewController.swift
//  Feather
//
//  Created by موضي الحربي on 04/05/1443 AH.
//

import UIKit
import CoreData

class SallonPhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UIPickerViewDelegate,  UIPickerViewDataSource {
    
    
    var persntenContiner : NSPersistentContainer = {
        let contner = NSPersistentContainer(name: "Feather")
        contner.loadPersistentStores(completionHandler: { des, error in
            if let error = error {
                print(error)
            }
            
        })
        return contner
    } ()
    
    var selctedService : Service?
    
    
    var order : Order!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pickerServic: UIPickerView!
    
    @IBOutlet weak var dateView: UITextField!
    
    
    
    
    @IBOutlet weak var lblServiceName: UILabel!
    
    
    
    @IBOutlet weak var inputTextField: UITextField!
    let datePicker = UIDatePicker()
    
    
    
    var arrPhotoCatan = ["collictionCATAN-1","collictionCATAN2","collictionCATAN3","collictionCATAN4"]
    //[UIImage(named: "collictionCATAN-1")!,UIImage(named: "collictionCATAN2")!,UIImage(named: "collictionCATAN3")!,UIImage(named: "collictionCATAN4")!]
    
    var arrPhotoSwan = ["collictionSWAN1","collictiponSWAN2","collictionSWAN3","collictionSWAN4"]
    //[UIImage(named: "collictionSWAN1")!,UIImage(named: "collictiponSWAN2")!,UIImage(named: "collictionSWAN3")!,UIImage(named: "collictionSWAN4")!]
    
     var arrPhotoPearlyCare = ["Foga1","Foga2","Foga3","Foga4","Foga5"]
    //[UIImage(named: "FOGA")!,UIImage(named: "Foga1")!,UIImage(named: "Foga2")!,UIImage(named: "Foga3")!,UIImage(named: "Foga4")!,UIImage(named: "Foga5")!]
    
     var arrPhotoAntiAgmal = ["Foga1","Foga2","Foga3","Foga4","Foga5"]
    //[UIImage(named: "FOGA")!,UIImage(named: "Foga1")!,UIImage(named: "Foga2")!,UIImage(named: "Foga3")!,UIImage(named: "Foga4")!,UIImage(named: "Foga5")!]
    
     var arrPhotoFoga = ["Foga1","Foga2","Foga3","Foga4","Foga5"]
    //[UIImage(named: "FOGA")!,UIImage(named: "Foga1")!,UIImage(named: "Foga2")!,UIImage(named: "Foga3")!,UIImage(named: "Foga4")!,UIImage(named: "Foga5")!]
    
    
    var PickerCatan: [String : Double] = ["Pedicure 100 SR" : 100  ,"Manicure 150 SR" : 150 ,"Skin cleaning 90 SR" : 90 ,"Massage 220 SR" : 220 ,"Makeup 250 " : 250 ]
    

    
    var data:[(key:String,values:Double)]?
    
    var timer : Timer?
    var currentCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerServic.delegate = self
        pickerServic.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        startTimer()
        creatDatePicker()
        data = selctedService?.subServices.subServices.compactMap({(key:$0,values:$1)})
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex() {
        currentCellIndex += 1
        if currentCellIndex > (selctedService?.subServices.images.count)!-1 {
            currentCellIndex = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let images = selctedService?.subServices.images else {return 0}
        return images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "salonPhotosCell", for: indexPath) as! SalonsPhotoCollectionViewCell
        
        guard let images = selctedService?.subServices.images else {return UICollectionViewCell()}
        
        cell.imgPhotoSallon.image = UIImage(named: images[indexPath.row])
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width , height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selctedService?.subServices.subServices.count ?? 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data?[row].key
    }
    
    
    func createToolbar() -> UIToolbar {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        return toolbar
    }
    
    func creatDatePicker(){
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        inputTextField.textAlignment = .center
        inputTextField.inputView = datePicker
        inputTextField.inputAccessoryView = createToolbar()
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter ()
        dateFormatter.dateStyle = .medium
        
        
        self.inputTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    @IBAction func addService(_ sender: Any) {
        
        let alert = UIAlertController(title: "The appointment has been successfully booked ", message: "", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel))
        present(alert,animated: true)
        
        let name = data?[pickerServic.selectedRow(inComponent: 0)].key
        let price = data?[pickerServic.selectedRow(inComponent: 0)].values
        
        lblServiceName.text = name
        
        let selctedServiceDate = datePicker.date
        
        
        let context = persntenContiner.viewContext
        context.performAndWait({
            let newOrder = Order (context: context)
            newOrder.serviceName = name
            newOrder.date = selctedServiceDate
            
            do {
                try  context.save()
            } catch {
                print(error)
            }
            
        })
        performSegue(withIdentifier: "orderListSegue", sender: nil)
        
    }
    
    
    
}
