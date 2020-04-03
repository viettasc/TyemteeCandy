//
//  CandyView.swift
//  CoreDataProject
//
//  Created by Viettasc Doan on 4/3/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct CandyView: View {
    @Environment(\.managedObjectContext) var moc
    @State var filterValue = false
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Avatar")) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        Image("tyemtee")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .padding()
                    }
                    .frame(height: 231)
                }
                CountryFillter(type: .beginsWith, filterKey: "shortName", filterValue: filterValue ? "Z" : "T")
                Button("Add") {
                    self.filterValue.toggle()
                    let country1 = Country(context: self.moc)
                    country1.shortName = "T"
                    country1.fullName = "Tyemtee Kingdom"
                    let country2 = Country(context: self.moc)
                    country2.shortName = "Z"
                    country2.fullName = "Switzerland"
                    let candy1 = Candy(context: self.moc)
                    candy1.name = "Mars"
                    candy1.origin = country1
                    let candy2 = Candy(context: self.moc)
                    candy2.name = "KitKat"
                    candy2.origin = country1
                    let candy3 = Candy(context: self.moc)
                    candy3.name = "Twix"
                    candy3.origin = country1
                    let candy4 = Candy(context: self.moc)
                    candy4.name = "Toblerone"
                    candy4.origin = country2
                    try? self.moc.save()
                }
            }
            .navigationBarTitle("Tyemtee Candy")
            .foregroundColor(Color.pink.opacity(0.6))
        }
        
    }
}

struct CandyView_Previews: PreviewProvider {
    static var previews: some View {
        CandyView()
    }
}
