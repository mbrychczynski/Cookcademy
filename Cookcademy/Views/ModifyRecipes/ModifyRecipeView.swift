//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Mateusz Brychczynski on 26/07/2023.
//

import SwiftUI

struct ModifyRecipeView: View {
    enum Selection {
        case main, ingredients, directions
    }
    
    @Binding var recipe: Recipe
    
    @State private var selection = Selection.main
    
    var body: some View {
        VStack {
            Picker("Select recipe component", selection: $selection) {
                Text("Main Info").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch selection {
            case .main:
                Text("Main Editor")
            case .ingredients:
                Text("Ingredients Editor")
            case .directions:
                Text("Directions Editor")
            }
            Spacer()
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
