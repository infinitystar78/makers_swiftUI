//
//  RecipeViewModel.swift
//  Recipe Time
//
//  Created by M W on 03/11/2022.
//

import Foundation


class RecipeInputViewModel: ObservableObject {
    
    @Published var recipiesArray : [Recipe] = []
    
    var ingredientsTitle = "Ingredients"
    var timeToCookTitle = "Time to cook"
    var ratingTitle = "Rating"
    var instructionsTitle = "Instructions"
    var portionSizeTitle = "Portion Size"
    var nutritionalInformationTitle = "Nutritional Information"
    var dateTitle = "Date"
    var timeToCookTextFieldPrompt = "Time to cook"
    
    
    
    ////save function
    func saveRecipe(){
        
        
    }
    
}
