//
//  LandingPageView.swift
//  allo-feeder
//
//  Created by Benjamin Wright on 06/06/2026.
//

import SwiftUI
import CoreData

struct TabData: Identifiable {
    var id: Int
    var name: String
    var component: AnyView
    var image: String
}

var tabs: [TabData] = [
    TabData(id: 1, name: "Data", component: AnyView(DataView()), image: "externaldrive"),
    TabData(id: 2, name: "Planner", component: AnyView(Text("Planner")), image: "calendar"),
    TabData(id: 3, name: "List", component: AnyView(Text("List")), image: "checklist"),
    TabData(id: 4, name: "Settings", component: AnyView(Text("Settings")), image: "gearshape.fill")
]

struct LandingPageView: View {
    var body: some View {
        TabView {
            ForEach(tabs) { tab in
                Tab(tab.name, systemImage: tab.image) {
                    tab.component
                }
            }
        }
    }
}

#Preview {
    LandingPageView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
