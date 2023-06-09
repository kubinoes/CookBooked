//
//  ContentView.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 08/06/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    @State private var showingAddRecipe = false
    
    var body: some View {
        NavigationStack {
            List(recipes, id: \.self) { recipe in
                NavigationLink {
                    RecipeView()
                } label: {
                    Text(recipe.title ?? "Unknown recipe name")
                }
            }
            .navigationTitle("Your Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddRecipe.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddRecipe) {
            AddRecipeView()
        }
    }
}

struct RecipeName: View {
    var body: some View {
        ZStack {
            Text("Pancakes")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
        }
        .background(.yellow)
        .cornerRadius(10)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
