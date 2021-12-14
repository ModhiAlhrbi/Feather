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
    var setSelctedService : Service?
    
    
    var order : Order!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pickerServic: UIPickerView!
    
    @IBOutlet weak var dateView: UITextField!
    
    
    
    
    @IBOutlet weak var lblServiceName: UILabel!
    
    
    
    @IBOutlet weak var inputTextField: UITextField!
    let datePicker = UIDatePicker()
    
    
    
    var arrPhotoSallon = [UIImage(named: "FOGA")!,UIImage(named: "Foga1")!,UIImage(named: "Foga2")!,UIImage(named: "Foga3")!,UIImage(named: "Foga4")!,UIImage(named: "Foga5")!]
    
    var arrServicesPicker = ["Pedicure","Manicure","Skin cleaning","Massage","Makeup"]
    /*Service(nameService: "Pedicure", imgServicePhoto: UIImage(named: "pedicure")!),
     Service(nameService: "Manicure", imgServicePhoto: UIImage(named: "manicure2")!),
     Service(nameService: "Skin cleaning", imgServicePhoto: UIImage(named: "Skin cleaning1")!),
     Service(nameService: "Massage", imgServicePhoto: UIImage(named: "Massage1")!),
     Service(nameService: "Makeup", imgServicePhoto: UIImage(named: "makeup1")!)
     ]
     */
    
    
    
    var timer : Timer?
    var currentCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSelctedService = selctedService
        pickerServic.delegate = self
        pickerServic.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        startTimer()
        creatDatePicker()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex() {
        currentCellIndex += 1
        if currentCellIndex > arrPhotoSallon.count-1 {
            currentCellIndex = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPhotoSallon.count    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "salonPhotosCell", for: indexPath) as! SalonsPhotoCollectionViewCell
        
        cell.imgPhotoSallon.image = arrPhotoSallon[indexPath.row]
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
        return arrServicesPicker.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrServicesPicker[row]
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
        
        lblServiceName.text = arrServicesPicker[pickerServic.selectedRow(inComponent: 0)]
        
        let selectedServiceName = arrServicesPicker[pickerServic.selectedRow(inComponent: 0)]
        let selctedServiceDate = datePicker.date
        
        
        let context = persntenContiner.viewContext
        context.performAndWait({
            let newOrder = Order (context: context)
            newOrder.serviceName = selectedServiceName
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
