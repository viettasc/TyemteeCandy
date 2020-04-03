//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Viettasc Doan on 4/2/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
//    @FetchRequest(entity: Country.entity(), sortDescriptors:) var countries: FetchedResults<Country>
    var body: some View {
        CandyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
