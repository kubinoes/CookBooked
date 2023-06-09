//
//  RecipeView.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 08/06/2023.
//

import SwiftUI

struct RecipeView: View {
    private var ingredients = ["1 ½ cups all-purpose flour", "3 ½ teaspoons baking powder", "1 tablespoon white sugar", "¼ teaspoon salt, or more to taste", "1 ¼ cups milk", "3 tablespoons butter, melted", "1 egg"]
    
    private var directions = [
        "Sift flour, baking powder, sugar, and salt together in a large bowl. Make a well in the center and add milk, melted butter, and egg; mix until smooth.",
        "Heat a lightly oiled griddle or pan over medium-high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake; cook until bubbles form and the edges are dry, about 2 to 3 minutes. Flip and cook until browned on the other side. Repeat with remaining batter.",
        
    ]
    
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
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                        
                        Text("Directions")
                            .font(.title2)
                            .padding(.vertical)
                        ForEach(directions, id: \.self) { step in
                            Text(step)
                                .padding(.bottom)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
        }
        .navigationTitle("Recipe name")
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecipeView()
        }
    }
}
