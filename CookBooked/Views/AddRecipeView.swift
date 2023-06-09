//
//  AddRecipe.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 09/06/2023.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var title = ""
    @State private var ingredients = [String]()
    
    var body: some View {
        Form {
            Section {
                TextField("Recipe name", text: $title)
            } header: {
                Text("Create a name for your recipe")
            }
            
            Section {
                NavigationLink {
                    Text("this will show ingredients list")
                } label: {
                    Text("Ingredients")
                }
            }
            
            Section {
                NavigationLink {
                    Text("this will show directions")
                } label: {
                    Text("Directions")
                }
            }
            
        }
        .navigationTitle("Add new recipe")
        .toolbar {
            Button("Save") {
                #warning("save the recipe functionality missing!")
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddRecipeView()
        }
    }
}
