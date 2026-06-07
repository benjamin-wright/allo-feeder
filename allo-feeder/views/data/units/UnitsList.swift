//
//  UnitsList.swift
//  allo-feeder
//
//  Created by Benjamin Wright on 07/06/2026.
//

import SwiftUI
import CoreData

struct UnitsList: View {
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
        
    // Store the fetch request configuration
    @FetchRequest var units: FetchedResults<Unit>
    
    // Custom initializer to set the predicate
    init(kind: UnitKind) {
        // Assign to _fetchRequest to inject the new configuration
        _units = FetchRequest<Unit>(
            entity: Unit.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \Unit.name, ascending: true)
            ],
            predicate: NSPredicate(format: "kind == %i", kind.rawValue),
            animation: .default
        )
    }
    
    var body: some View {
        List {
            ForEach(Array(units), id: \.objectID) { unit in
                Text("Unit: " + (unit.name ?? "unknown"))
            }.onDelete(perform: deleteUnits)
        }
        .toolbar {
            EditButton()
        }
    }
    
    private func deleteUnits(at offsets: IndexSet) {
        offsets.map { units[$0] }.forEach(context.delete)
        
        do {
            try context.save()
        } catch {
            context.rollback()
            assertionFailure("Failed to save context after delete: \(error)")
        }
    }
}

#Preview {
    NavigationStack {
        UnitsList(kind: .Count).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
