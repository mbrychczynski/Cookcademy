//
//  ModifyDirectionView.swift
//  Cookcademy
//
//  Created by Mateusz Brychczynski on 31/07/2023.
//

import SwiftUI

struct ModifyDirectionView: View {
    @Binding var direction: Direction
    let createAction: (Direction) -> Void
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Direction Description", text: $direction.description)
                .listRowBackground(listBackgroundColor)
            Toggle("Optional", isOn: $direction.isOptional)
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save") {
                    createAction(direction)
                    dismiss()
                }
                Spacer()
            }
            .listRowBackground(listBackgroundColor)
        }
        .foregroundColor(listTextColor)
    }
}

struct ModifyDirectionView_Previews: PreviewProvider {
    @State static var emptyDirection = Direction(description: "", isOptional: false)
    static var previews: some View {
        NavigationView {
            ModifyDirectionView(direction: $emptyDirection) { _ in return }
        }
    }
}
