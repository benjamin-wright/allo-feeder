//
//  UnitsList.swift
//  allo-feeder
//
//  Created by Benjamin Wright on 07/06/2026.
//

import SwiftUI
import CoreData

struct UnitsList: View {
    // Store the fetch request configuration
    @FetchRequest var units: FetchedResults<Unit>
    
    // Custom initializer to set the predicate
    init(kind: UnitKind) {
        // Assign to _fetchRequest to inject the new configuration
        _units = FetchRequest<Unit>(
            entity: Unit.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "kind == %i", kind.rawValue)
        )
    }
    
    var body: some View {
        Text("Units:")
        ForEach(units) { unit in
            Text("Unit: " + (unit.name ?? "unknown"))
        }
    }
}

#Preview {
    UnitsList(kind: .Count).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
