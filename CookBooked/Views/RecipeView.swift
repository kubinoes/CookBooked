//
//  RecipeView.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 08/06/2023.
//

import SwiftUI
import CoreData

struct RecipeView: View {
    @ObservedObject var recipe: Recipe
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image("pancake")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .padding(.vertical)
                            .font(.title2)
                        ForEach(recipe.ingredients ?? [String](), id: \.self) { ingredient in
                            Text(ingredient)
                        }
                        
                        Text("Directions")
                            .font(.title2)
                            .padding(.vertical)
                        ForEach(recipe.directions ?? [String](), id: \.self) { step in
                            Text(step)
                                .padding(.bottom)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
        }
        .navigationTitle(recipe.title ?? "Unknown recipe name")
    }
}

struct RecipeView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let recipe = Recipe(context: moc)
        recipe.id = UUID()
        recipe.title = "Test Recipe"
        recipe.ingredients = ["salt", "sugar"]
        recipe.directions = ["first", "second"]
        
        return RecipeView(recipe: recipe)
    }
}
