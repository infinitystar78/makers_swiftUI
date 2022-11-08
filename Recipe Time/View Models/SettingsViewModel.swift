//
//  SettingsViewModel.swift
//  Recipe Time
//
//  Created by M W on 04/11/2022.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    private var userDefaults: RecipeTimeUserDefaults
    @Published var firstName = String()
    @Published var lastName = String()
    @Published var pushNotifications = Bool()
    @Published var numberOfTimesRun = Int()
    
    init(recipeUserDefaults:RecipeTimeUserDefaults){
        userDefaults = recipeUserDefaults
        userDefaults.load()
        
    }
    
    func save( _ key: RecipeUserDefaultsKeys,
               firstName: String = "",
               lastName: String = "",
               numberOfTimesRun: Int = 0,
               pushNotificationsPref : Bool = false
    ){
        switch key {
        case .firstName, .lastName:
            userDefaults.saveName(firstName, lastName)
        case .numberOfTimesRun:
            userDefaults.saveNumberOfTimeRun(numberOfTimesRun)
        case .pushNotificationsPreferences:
            userDefaults.savePushPreference(pushNotificationsPref)
        }
        
    }
    
    
    
}
