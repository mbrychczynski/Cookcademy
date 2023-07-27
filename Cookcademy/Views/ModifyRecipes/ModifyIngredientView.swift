//
//  ModifyIngredientView.swift
//  Cookcademy
//
//  Created by Mateusz Brychczynski on 27/07/2023.
//

import SwiftUI

struct ModifyIngredientView: View {
    @State var ingredient: Ingredient
    
    var body: some View {
        VStack {
            Form {
                TextField("Ingredient Name", text: $ingredient.name)
                Stepper(value: $ingredient.quantity, in: 0...100, step: 0.5) {
                    HStack {
                        Text("Quantity:")
                        TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                Picker(selection: $ingredient.unit) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                } label: {
                    HStack {
                        Text("Unit")
                    }
                }
                .pickerStyle(.menu)
            }
        }
    }
}

struct ModifyIngredientView_Previews: PreviewProvider {
    @State static var emptyIngredient = Ingredient(name: "",
                                                   quantity: 1.0,
                                                   unit: .none)
    static var previews: some View {
        NavigationView {
            ModifyIngredientView(ingredient: emptyIngredient)
        }
    }
}

extension NumberFormatter {
  static var decimal: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }
}
