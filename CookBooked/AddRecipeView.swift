//
//  AddRecipe.swift
//  CookBooked
//
//  Created by Jakub Schovanec on 09/06/2023.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var title = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Recipe name", text: $title)
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
