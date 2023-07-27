//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Mateusz Brychczynski on 27/07/2023.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @Binding var mainInformation: MainInformation
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
            TextField("Author", text: $mainInformation.author)
            Section {
                TextEditor(text: $mainInformation.description)
            } header: {
                Text("Description")
            }
            Picker(selection: $mainInformation.category) {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                }
            } label: {
                HStack {
                    Text("Category")
                    Spacer()
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(.menu)
        }
        .foregroundColor(listTextColor)
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name",
                                                        description: "Test Description",
                                                        author: "Test Author",
                                                        category: .breakfast)
    @State static var emptyInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)
    
    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInformation)
        ModifyMainInformationView(mainInformation: $emptyInformation)
    }
}
