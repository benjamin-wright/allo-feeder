//
//  DataView.swift
//  allo-feeder
//
//  Created by Benjamin Wright on 06/06/2026.
//

import SwiftUI

extension DataView {
    enum ViewDestination: Hashable, CaseIterable {
        case units, categories, ingredients, recipies
    }
}

struct DataView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Units", value: ViewDestination.units)
                NavigationLink("Categories", value: ViewDestination.categories)
                NavigationLink("Ingredients", value: ViewDestination.ingredients)
                NavigationLink("Recipies", value: ViewDestination.recipies)
            }.navigationTitle("Data")
            .navigationDestination(for: ViewDestination.self) { view in
                switch view {
                case .units:
                    UnitsView().navigationTitle("Units")
                case .categories:
                    Text("Categories").navigationTitle("Catgories")
                case .ingredients:
                    Text("Ingredients")
                case .recipies:
                    Text("Recipies")
                }
            }
        }
    }
}

#Preview {
    DataView()
}
