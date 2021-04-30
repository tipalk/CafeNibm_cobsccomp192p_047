//
//  CartHandler.swift
//  CafeNibm
//
//  Created by Tiny Pahattuge on 2021-04-30.
//

import Foundation

class CardHandler{
    static var foodItems:[FoodItem] = []
    
    static func getCartItem() -> [FoodItem] {
        return foodItems
    }
    
    static func clearCart(){
        self.foodItems.removeAll()
    }
}
