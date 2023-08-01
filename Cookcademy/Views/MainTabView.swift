//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Mateusz Brychczynski on 01/08/2023.
//

import SwiftUI

struct MainTabView: View {
  @StateObject private var recipeData = RecipeData()
 
  var body: some View {
    TabView {
      RecipeCategoryGridView()
        .tabItem { Label("Recipes", systemImage: "list.dash") }
      NavigationView {
        RecipesListView(viewStyle: .favorites)
      }.tabItem { Label("Favorites", systemImage: "heart.fill") }
      SettingsView()
        .tabItem { Label("Settings", systemImage: "gear") }
    }
    .environmentObject(recipeData)
  }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
