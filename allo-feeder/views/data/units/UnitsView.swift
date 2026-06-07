//
//  UnitsView.swift
//  allo-feeder
//
//  Created by Benjamin Wright on 06/06/2026.
//

import SwiftUI
import CoreData

struct UnitsView: View {
    var body: some View {
        TabbedStack(pages: [
            TabPage(title: "Count", content: AnyView(
                UnitsList(kind: .Count)
            )),
            TabPage(title: "Weight", content: AnyView(
                UnitsList(kind: .Weight)
            )),
            TabPage(title: "Volume", content: AnyView(
                UnitsList(kind: .Volume)
            )),
        ])
    }
}

#Preview {
    UnitsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
