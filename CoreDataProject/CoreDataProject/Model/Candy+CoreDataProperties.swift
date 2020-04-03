//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Viettasc Doan on 4/3/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
    
}
