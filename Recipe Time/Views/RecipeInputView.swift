//
//  RecipeInputView.swift
//  Recipe Time
//
//  Created by M W on 03/11/2022.
//

import SwiftUI

struct RecipeInputView: View {
    @State private var ingredientsText = ""
    @State private var timeToCookText = ""
    @State private var rating = 0
    @State private var selectedDate = Date()
    @StateObject var model = RecipeInputViewModel()

    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image("default-image")
                        .resizable()
                        .scaledToFit()
                    HStack {
                        Text("Burger")
                            .foregroundColor(.yellow)
                            .bold()
                            .font(.system(size: 72))
                        Spacer()
                    }

                }.ignoresSafeArea(.all)

                HStack {
                    Text(model.ingredientsTitle)
                    Spacer()
                }.padding()

                TextEditor(text: $ingredientsText)
                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 50)
                    .cornerRadius(25)
                    .border(.yellow, width: 1)
                    .lineSpacing(10)
                    .autocapitalization(.words)
                    .disableAutocorrection(true)
                    .padding()

                TextField(model.timeToCookTextFieldPrompt, text: $timeToCookText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                HStack {
                    Text(model.ratingTitle)
                    Spacer()
                    Stepper("\(rating)", value: $rating, in: 0 ... 5, step: 1)
                    Spacer()

                }.padding()

                DatePicker(
                    "Pick a date",
                    selection: $selectedDate,
                    in: Date()...,
                    displayedComponents: [.date])
                    .padding()

                Button {
                    ///action
                    model.saveRecipe()
                    
                }
                label: {
                    /// button styling
                    HStack{
                        Image(systemName: "folder")
                            .foregroundColor(.black)
                        Text("Save Recipe")
                            .foregroundColor(.green)
                    }.frame(maxWidth: .infinity, idealHeight: 44)
                
                }.border(Color.orange, width: 5)
                    .cornerRadius(10)
            

                
                
                
                // Spacer()
            }
        }
    }
}

struct RecipeInputView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeInputView()
    }
}
