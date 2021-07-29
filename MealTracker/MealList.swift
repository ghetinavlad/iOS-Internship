//
//  MealList.swift
//  MealList
//
//  Created by Wolfpack Digital on 29.07.2021.
//

import Foundation


struct mealList  {
    var createMeal: [Meal] {
        let firstMeal = Meal(name: "breakfast", food: [])
        let secondMeal = Meal(name: "lunch", food: [])
        let thirdMeal = Meal(name: "dinne", food: [])
        return [firstMeal, secondMeal, thirdMeal]
    }
}
