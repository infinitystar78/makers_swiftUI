//
//  RecipeInputView.swift
//  Recipe Time
//
//  Created by M W on 03/11/2022.
//

import SwiftUI

struct RecipeInputView: View {
    @State private var ingredientsText = ""
    @State private var instructionsText = ""
    @State private var timeToCookText = ""
    @State private var nutritionalInformationText = ""
    @State private var rating = 0
    @State private var portionSize = 0
    @State private var selectedDate = Date()
    @State private var selectedCuisine = ""
    @State private var recipeName = "Name"
    @StateObject var model = RecipeInputViewModel()
    @State private var presentAlert = false

    var body: some View {
        VStack {
            ZStack {
                Image("default-image")
                    .resizable()
                    .scaledToFit()
                HStack {
                    Text(recipeName)
                        .modifier(Title())
                    
                      //  .foregroundColor(.yellow)
                        //.bold()
                       // .font(.system(size: 72))
                    Button {
                        presentAlert = true
                    } label: {
                        Image(systemName: "pencil")
                            .foregroundColor(.orange)
                    }.alert("Login", isPresented: $presentAlert, actions: {
                        TextField("Recipe Name", text: $recipeName)

                        Button("Save", action: {})

                    }, message: {
                        Text("Please enter recipe name.")
                    })

                    Spacer()
                }

            }.ignoresSafeArea(.all)

            ScrollView {
                RecipeTextEditorView(textEditorTitle: model.ingredientsTitle, textEditorText: ingredientsText)

                VStack(spacing: 0) {
                    HStack {
                        Text(model.timeToCookTitle)
                        Spacer()
                    }

                    HStack(spacing: 0) {
                        Image(systemName: "clock")

                        TextField(model.timeToCookTextFieldPrompt, text: $timeToCookText)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }

                }.padding()

                HStack {
                    Text(model.ratingTitle)
                    Spacer()
                    Stepper("\(rating)", value: $rating, in: 0 ... 5, step: 1)
                    Spacer()

                }.padding()

                RecipeTextEditorView(textEditorTitle: model.instructionsTitle, textEditorText: instructionsText)

                HStack {
                    Text(model.portionSizeTitle)
                    Spacer()
                    Stepper("\(portionSize)", value: $portionSize, in: 0 ... 5, step: 1)
                    Spacer()

                }.padding()

                RecipeTextEditorView(textEditorTitle: model.nutritionalInformationTitle, textEditorText: nutritionalInformationText)

                VStack {
                    DatePicker(
                        "Pick a date",
                        selection: $selectedDate,
                        in: Date()...,
                        displayedComponents: [.date])
                        .padding()

                    Picker("Cuisine", selection: $selectedCuisine) {
                        ForEach(Cuisine.allCases, id: \.self) {
                            Text("\($0.rawValue.capitalized)").tag($0)
                                .font(.callout)
                                .foregroundColor(.black)
                        }
                    }.pickerStyle(.menu)
                        .tint(.orange)
                }

                Button {
                    /// action
                    model.saveRecipe()
                }
                label: {
                    /// button styling
                    HStack {
                        Image(systemName: "folder")
                            .foregroundColor(.white)
                        Text("Save Recipe")
                            .foregroundColor(.white)
                    }.frame(maxWidth: .infinity, idealHeight: 44)
                }.buttonStyle(RecipeTimeButtonViewModifer())
                    .padding()
            }
        }
    }
}

struct RecipeInputView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeInputView().preferredColorScheme(.light)
    }
}
