//
//  FavouriteProduct+CoreDataProperties.swift
//  
//
//  Created by Антон Тимонин on 24.12.2020.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension FavouriteProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteProduct> {
        return NSFetchRequest<FavouriteProduct>(entityName: "FavouriteProduct")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var type: String?
    @NSManaged public var url: String?

}

extension FavouriteProduct : Identifiable {

}
