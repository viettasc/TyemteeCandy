//
//  WizardView.swift
//  CoreDataProject
//
//  Created by Viettasc Doan on 4/2/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct WizardView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    var body: some View {
        
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: self.moc)
                wizard.name = "Harry Potter"
                if self.moc.hasChanges {
                    try? self.moc.save()
                }
            }

        }
        
    }
}

struct WizardView_Previews: PreviewProvider {
    static var previews: some View {
        WizardView()
    }
}
