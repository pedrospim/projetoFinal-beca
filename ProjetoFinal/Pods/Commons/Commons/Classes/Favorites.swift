//
//  Favorites.swift
//  ProjetoFinal
//
//  Created by Pedro Spim Costa on 28/01/21.
//

import Foundation

public let sharedFavorites = Favorites()

public class Favorites {
    public func getFavorites() -> [String:[String: String]] {
        guard let favorites = UserDefaults.standard.object(forKey: "favorites") as? [String:[String: String]] else { return [:]}
        return favorites
    }

    public func checkIfFirstTime() {
        if UserDefaults.standard.object(forKey: "favorites") as? [String:[String: String]] == nil {
            UserDefaults.standard.set([:], forKey: "favorites")
        }
    }
    public func toggleFavorite(shortname:String, name:String, price:String, idIcon: String) {
        var favorites = getFavorites()
        if favorites[shortname] == nil {
            favorites[shortname] = ["name":name,"price":price, "idIcon":idIcon]
        } else {
            favorites[shortname] = nil
        }
        UserDefaults.standard.set(favorites, forKey: "favorites")
    }
    public func checkIfFavorite(assetId:String) -> Bool{
        let favorites = getFavorites()
        if favorites[assetId] != nil {
            return true
        } else {
            return false
        }
    }
}
