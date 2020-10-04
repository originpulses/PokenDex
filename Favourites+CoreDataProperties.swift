//
//  Favourites+CoreDataProperties.swift
//  PokenDex
//
//  Created by Sabih on 4/10/20.
//  Copyright © 2020 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension Favourites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourites> {
        return NSFetchRequest<Favourites>(entityName: "Favourites")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var image: String?
    @NSManaged public var pokedexID: String?
    @NSManaged public var isFav: Bool

}
