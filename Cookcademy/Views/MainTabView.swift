//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Mateusz Brychczynski on 01/08/2023.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem {
                    Label("Recipes", systemImage: "list.dash")
                }
            NavigationView {
                RecipesListView(category: .breakfast)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }
        .environmentObject(recipeData)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
