//
//  AddIngredientsView.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 09/06/2023.
//

import SwiftUI

struct AddIngredientsView: View {
    @State private var newIngredient = ""
    @Binding var ingredients: [String]
    
    var body: some View {
        Group {
            Section {
                HStack {
                    TextField("New ingredient", text: $newIngredient)
                    Button("Add") {
                        ingredients.append(newIngredient)
                        newIngredient = ""
                    } .disabled(newIngredient.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            } header: {
                Text("Add new ingredient")
            }
            if !ingredients.isEmpty {
                Section {
                    List {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                        .onDelete(perform: deleteIngredient)
                    }
                } header: {
                    HStack {
                        Text("Ingredients")
                        Spacer()
                        EditButton()
                            .font(.subheadline)
                    }
                }
            }
        }
    }
    
    func deleteIngredient(offsets: IndexSet) {
        ingredients.remove(atOffsets: offsets)
    }
}

struct AddIngredientsView_Previews: PreviewProvider {
    @State static private var ingredients = [String]()
    
    static var previews: some View {
        Form {
            AddIngredientsView(ingredients: $ingredients)
        }
    }
}
