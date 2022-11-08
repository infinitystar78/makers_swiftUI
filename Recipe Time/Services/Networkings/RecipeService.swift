//
//  RecipeService.swift
//  Recipe Time
//
//  Created by M W on 08/11/2022.
//

import Foundation

enum RecipeService {
    case nutrition(nutrition: String)
    case recipes
}

extension RecipeService: Service {
    var baseURL: String {
        return "https://gateway.recipeworld.com"
    }

    var path: String {
        switch self {
        case .nutrition:
            return "/v1/public/nutrition"
        case .recipes:
            return "/v1/public/recipes"
        }
    }

    var parameters: [String: Any]? {
        //default
        var params: [String: Any] = ["apikey": "45348954359439fasda"]
        switch self {
            
        case .nutrition(let nutrition):
            params["nutrition"] = nutrition
        case .recipes:
            print("no parameters")
        }
        return params
    }

    var method: APIMethod {
        switch self{
        case .nutrition:
            return .get
        case .recipes:
            return .post
        }
    }
}
