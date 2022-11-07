//
//  HomeView.swift
//  Recipe Time
//
//  Created by M W on 04/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var presentRecipeInput = false
    @State private var presentSettings = false
    @State private var presentRecipeList = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image(systemName: "ellipsis.circle")
                        .onTapGesture {
                            presentSettings.toggle()
                        }
                    Spacer()
                }.padding()
                
                HStack{
                    Text("Recipe Time")
                        .font(.largeTitle)
                    .bold()
                    
                    Spacer()
                    Button {
                        presentRecipeInput.toggle()
                    } label: {
                       Image(systemName: "plus.square")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .foregroundColor(.orange)
                    }

                }.padding()
                NavigationLink{
                    
                    
                } label: {
                    
                }.navigationDestination(isPresented: $presentRecipeInput) {
                    RecipeInputView()
                }
                .navigationDestination(isPresented: $presentSettings) {
                    SettingsView()
                }
                .navigationDestination(isPresented: $presentRecipeList) {
                    RecipeListView()
                }
                
                Spacer()
                
            }
            
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
