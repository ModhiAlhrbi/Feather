//
//  Order+CoreDataProperties.swift
//  Feather
//
//  Created by موضي الحربي on 10/05/1443 AH.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var serviceName: String?
    @NSManaged public var date: Date?

}

extension Order : Identifiable {

}
