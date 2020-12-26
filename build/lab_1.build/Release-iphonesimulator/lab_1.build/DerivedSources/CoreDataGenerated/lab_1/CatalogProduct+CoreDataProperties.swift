//
//  CatalogProduct+CoreDataProperties.swift
//  
//
//  Created by Антон Тимонин on 24.12.2020.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension CatalogProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatalogProduct> {
        return NSFetchRequest<CatalogProduct>(entityName: "CatalogProduct")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var type: String?
    @NSManaged public var url: String?

}

extension CatalogProduct : Identifiable {

}
