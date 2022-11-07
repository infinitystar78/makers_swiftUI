//
//  SettingsView.swift
//  Recipe Time
//
//  Created by M W on 04/11/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var model = SettingsViewModel()
    
    var body: some View {
        Text("Settings")
    }
    
    
    func save(){
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
