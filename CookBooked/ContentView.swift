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
    
    private var recipess = ["recipe1", "recioe2"]
    
    var body: some View {
        NavigationStack {
            List(recipess, id: \.self) { recipe in
                NavigationLink {
                    RecipeView()
                } label: {
                    Text(recipe)
                }
            }
            .navigationTitle("Your Recipes")
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
