//
//  RecipeViewModel.swift
//  Recipe Time
//
//  Created by M W on 03/11/2022.
//

import Foundation


protocol RecipeInputModelProtocol {
    var ingredientsTitle: String { get set }
    var timeToCookTitle: String { get set }
    var ratingTitle: String { get set }
    var instructionsTitle: String { get set }
    var portionSizeTitle: String { get set }
    var nutritionalInformationTitle: String { get set }
    var dateTitle: String { get set }
    var timeToCookTextFieldPrompt: String { get set }
    
    func saveRecipe() -> Bool
    func doublePortionSize(portionSize: Int) -> Int
    
}



class RecipeInputViewModel: ObservableObject, RecipeInputModelProtocol {
    
    @Published var recipiesArray : [Recipe] = []
    
    var ingredientsTitle = "Ingredients"
    var timeToCookTitle = "Time to cook"
    var ratingTitle = "Rating"
    var instructionsTitle = "Instructions"
    var portionSizeTitle = "Portion Size"
    var nutritionalInformationTitle = "Nutritional Information"
    var dateTitle = "Date"
    var timeToCookTextFieldPrompt = "Time to cook"
    let provider: NetworkServiceProvider<RecipeService>
  
    init(provider: NetworkServiceProvider<RecipeService> = NetworkServiceProvider<RecipeService>()){
        self.provider = provider
    }
    
    func callNetworkService(){
        provider.load(service: .recipes) { result in
            switch result {
            case .success(let response):
              print("response=\(response)")
            case .failure(let error):
                print(error.localizedDescription)
            case .empty:
                print("No Data")
            }
        }
        
    }
    
    ////save function
    func saveRecipe() -> Bool {
      //TODO: write out save function
     return false
        
    }
    
    
    
    func doublePortionSize(portionSize: Int) -> Int{
        return portionSize * 2
    }
    
}
