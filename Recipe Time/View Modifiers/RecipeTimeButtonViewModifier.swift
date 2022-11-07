//
//  RecipeTimeButtonViewModifier.swift
//  Recipe Time
//
//  Created by M W on 04/11/2022.
//

import Foundation
import SwiftUI

struct RecipeTimeButtonViewModifer: ButtonStyle {
   
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.orange)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
    
    
}
