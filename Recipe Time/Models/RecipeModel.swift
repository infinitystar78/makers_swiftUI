//
//  RecipeModel.swift
//  Recipe Time
//
//  Created by M W on 03/11/2022.
//

import Foundation
import SwiftUI

enum Cuisine: String, CaseIterable {
    case british
    case spanish
    case indian
    case italian
    case chinese
    case healthy
    case quick
}


struct Recipe {
    var name: String
    var ingredients: String
    var timeToCook: String
    var rating: String
    var instructions: String
    var photo: Image
    var portionSize: Int
    var nutritionalInformation: String
    var cuisine: Cuisine
    var date: Date

}
