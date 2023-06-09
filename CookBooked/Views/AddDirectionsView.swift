//
//  AddDirectionsView.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 09/06/2023.
//

import SwiftUI

struct AddDirectionsView: View {
    @State private var newDirection = ""
    @Binding var directions: [String]
    
    var body: some View {
        Group {
            Section {
                HStack {
                    TextField("New direction", text: $newDirection)
                    Button("Add") {
                        directions.append(newDirection)
                        newDirection = ""
                    } .disabled(newDirection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            } header: {
                Text("Add new direction")
            }
            if !directions.isEmpty {
                Section {
                    List {
                        ForEach(directions, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                        .onDelete(perform: deleteIngredient)
                    }
                } header: {
                    HStack {
                        Text("Directions")
                        Spacer()
                        EditButton()
                            .font(.subheadline)
                    }
                }
            }
        }
    }
    
    func deleteIngredient(offsets: IndexSet) {
        directions.remove(atOffsets: offsets)
    }}

struct AddDirectionsView_Previews: PreviewProvider {
    @State static private var directions = [String]()
    
    static var previews: some View {
        Form {
            AddDirectionsView(directions: $directions)
        }
    }
}
