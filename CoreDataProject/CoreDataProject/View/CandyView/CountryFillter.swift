//
//  CountryFillter.swift
//  CoreDataProject
//
//  Created by Viettasc Doan on 4/3/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI
import CoreData

struct CountryFillter: View {
    
    var fetchRequest: FetchRequest<Country>
    var countries: FetchedResults<Country> { fetchRequest.wrappedValue }
    
    enum PredicateType {
        case beginsWith
        case greater
    }
    
    init(type: PredicateType, filterKey: String, filterValue: String) {
        let entity = Country.entity()
        let descriptor = [NSSortDescriptor(keyPath: \Country.shortName, ascending: true)]
        var format = "BEGINSWITH[c]"
        switch type {
        case .beginsWith:
            format = "BEGINSWITH[c]"
            break
        default:
            format = ">"
            break
        }
        let predicate = NSPredicate(format: "%K \(format) %@", filterKey, filterValue)
        fetchRequest = FetchRequest(entity: entity, sortDescriptors: descriptor, predicate: predicate)
    }
    
    var body: some View {
        List {
            ForEach(countries, id: \.self) { country in
                Section(header: Text(country.wrappedFullName)) {
                    ForEach(country.candyArray, id: \.self) { candy in
                        Text(candy.wrappedName)
                    }
                }
            }
        }
    }
}
