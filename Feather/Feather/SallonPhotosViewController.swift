//
//  SallonPhotosViewController.swift
//  Feather
//
//  Created by موضي الحربي on 04/05/1443 AH.
//

import UIKit

class SallonPhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrPhotoSallon = [UIImage(named: "FOGA")!,UIImage(named: "Foga1")!,UIImage(named: "Foga2")!,UIImage(named: "Foga3")!,UIImage(named: "Foga4")!,UIImage(named: "Foga5")!]
    
    var timer : Timer?
    var currentCellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        startTimer()
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
    
}
