//
//  Saloon.swift
//  Feather
//
//  Created by موضي الحربي on 04/05/1443 AH.
//

import Foundation
import UIKit

protocol Store {
    
    var name : String { get set}
    
}


struct Saloon : Store {

    var name : String
    var imagSaloon : UIImage
    var desc : String
    
}
