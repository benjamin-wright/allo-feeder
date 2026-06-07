//
//  UnitEdit.swift
//  allo-feeder
//
//  Created by Benjamin Wright on 07/06/2026.
//

import SwiftUI

struct UnitEdit: View {
    @Binding var text: String
    
    var body: some View {
        Form {
            Section {
                LabeledContent("Name:") {
                    TextField("thing", text: $text, axis: .horizontal)
                        .textInputAutocapitalization(.never)
                        .onChange(of: text) {
                            text = text.lowercased()
                        }
                        .lineLimit(1)
                        .submitLabel(.return)
                }
                Text("Base")
            }
        }
    }
}

#Preview {
    UnitEdit(text: .constant("hi"))
}
