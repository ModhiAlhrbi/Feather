//
//  Service.swift
//  Feather
//
//  Created by موضي الحربي on 03/05/1443 AH.
//

import Foundation
import UIKit

struct Service {
   
    let nameService : String
    let description : String
    let imgServicePhoto : UIImage
    let price : Double
    
    let subServices: SubServices
    
    
    
}

struct SubServices {
    
    let images : [String]
    let subServices : [String]
    
    
}
