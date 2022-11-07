//
//  RecipeTimeUserDefaults.swift
//  Recipe Time
//
//  Created by M W on 04/11/2022.
//

import Foundation

enum RecipeUserDefaultsKeys: String, CaseIterable {
    case firstName
    case lastName
    case numberOfTimesRun
    case pushNotificationsPreferences
}

class RecipeTimeUserDefaults {
    var firstName = String()
    var lastName = String()
    var pushNotifications = Bool()
    var numberOfTimesRun = Int()

    let defaults = UserDefaults.standard

    init() {}

    func saveName(_ firstName: String, _ lastName: String) {
        defaults.set(firstName, forKey: RecipeUserDefaultsKeys.firstName.rawValue)
        defaults.set(lastName, forKey: RecipeUserDefaultsKeys.lastName.rawValue)
    }

    func saveNumberOfTimeRun(_ numberOfTimesRun: Int) {
        defaults.set(numberOfTimesRun, forKey: RecipeUserDefaultsKeys.numberOfTimesRun.rawValue)
    }

    func savePushPreference(_ pushNotificationsPreference: Bool) {
        defaults.set(pushNotificationsPreference, forKey: RecipeUserDefaultsKeys.pushNotificationsPreferences.rawValue)
    }

    func load() {
        firstName = defaults.object(forKey: RecipeUserDefaultsKeys.firstName.rawValue) as! String
        lastName = defaults.object(forKey: RecipeUserDefaultsKeys.lastName.rawValue) as! String
        pushNotifications = defaults.object(forKey: RecipeUserDefaultsKeys.pushNotificationsPreferences.rawValue) as! Bool
        numberOfTimesRun = defaults.object(forKey: RecipeUserDefaultsKeys.numberOfTimesRun.rawValue) as! Int
    }

    func resetUserDefaults() {
        RecipeUserDefaultsKeys.allCases.forEach { key in
            defaults.removeObject(forKey: key.rawValue)
        }
    }
}
