//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Mateusz Brychczynski on 25/07/2023.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
