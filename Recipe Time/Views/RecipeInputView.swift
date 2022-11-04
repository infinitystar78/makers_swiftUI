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
                
                VStack(spacing:0){
                    HStack {
                        Text(model.ingredientsTitle)
                        Spacer()
                    }.padding(.horizontal)
                    
                    TextEditor(text: $ingredientsText)
                        .lineLimit(2)
                        .font(.title2)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 0.5).stroke())
                        .padding()
                    Spacer()
                }
                
                VStack(spacing:0){
                
                HStack {
                    Text(model.timeToCookTitle)
                    Spacer()
                }
                
                
                    HStack(spacing:0){
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
                    
                
                VStack(spacing:0){
                    HStack {
                        Text(model.instructionsTitle)
                        Spacer()
                    }.padding(.horizontal)
                    
                    TextEditor(text: $ingredientsText)
                        .lineLimit(2)
                        .font(.title2)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 0.5).stroke())
                        .padding()
                    Spacer()
                }
                
                
                HStack {
                    Text(model.portionSizeTitle)
                    Spacer()
                    Stepper("\(portionSize)", value: $portionSize, in: 0 ... 5, step: 1)
                    Spacer()
                    
                }.padding()
                
                VStack(spacing:0){
                    HStack {
                        Text(model.nutritionalInformationTitle)
                        Spacer()
                    }.padding(.horizontal)
                    
                    TextEditor(text: $nutritionalInformationText)
                        .lineLimit(2)
                        .font(.title2)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 0.5).stroke())
                        .padding()
                    Spacer()
                }
                
                
                
                
                VStack{
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
                            .foregroundColor(.black)
                        Text("Save Recipe")
                            .foregroundColor(.white)
                    }.frame(maxWidth: .infinity, idealHeight: 44)

                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.regular)
                .padding()

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
