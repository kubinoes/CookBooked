//
//  AddRecipe.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 09/06/2023.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var ingredients = [String]()
    @State private var directions = [String]()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Recipe name", text: $title)
                } header: {
                    Text("Create a name for your recipe")
                }
                
                AddIngredientsView(ingredients: $ingredients)
                
                AddDirectionsView(directions: $directions)
            }
            
            
            .navigationTitle("Add new recipe")
            .toolbar {
                Button("Save") {
                    let recipe = Recipe(context: moc)
                    
                    recipe.id = UUID()
                    recipe.title = title
                    recipe.ingredients = ingredients
                    recipe.directions = directions
                    
                    if moc.hasChanges {
                        try? moc.save()
                    }
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddRecipeView()
    }
}
