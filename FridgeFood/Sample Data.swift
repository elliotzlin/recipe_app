//
//  Sample Data.swift
//  Fridge Food
//
//  Created by Elliot on 6/18/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

import Foundation


let shrimpCreoleIngredients: [Ingredient] = [Ingredient(name: "Olive oil", qty: "2 tbpsns"), Ingredient(name: "Green bell peppers", qty: "0.5 cup"), Ingredient(name: "Onions", qty: "0.5 cup"), Ingredient(name: "Celery", qty: "0.5 cup"), Ingredient(name: "Chili powder", qty: "1 tsp"), Ingredient(name: "Tomatoes", qty: "1 (14 oz.) can"), Ingredient(name: "Tomato sauce", qty: "1 (8 oz.) can"), Ingredient(name: "Hot sauce", qty: "1 tbsp"), Ingredient(name: "Worcestershire sauce", qty: "1 tbsp"), Ingredient(name: "White sugar", qty: "1 tbsp"), Ingredient(name: "Salt"), Ingredient(name: "Pepper"), Ingredient(name: "Shrimp", qty: "1.5 lbs"), Ingredient(name: "Green onions")]

let lasagnaIngredients: [Ingredient] = [Ingredient(name: "Ground beef", qty: "1.5 lbs"), Ingredient(name: "Italian sausage", qty: "0.5 lb"), Ingredient(name: "Onion", qty: "1"), Ingredient(name: "Garlic cloves", qty: "2-3"), Ingredient(name: "Salt", qty: "1.5-2 tsps"), Ingredient(name: "Black pepper", qty: "1 tsp"), Ingredient(name: "Dried parsley flakes", qty: "1 tbsp"), Ingredient(name: "Oregano", qty: "1 tbsp"), Ingredient(name: "Dried basil", qty: "1 tbsp"), Ingredient(name: "Tomatoes", qty: "2 (14.5 oz.) cans"), Ingredient(name: "Tomato paste", qty: "2 (6 oz.) cans"), Ingredient(name: "Ricotta cheese", qty: "24 oz."), Ingredient(name: "Eggs", qty: "2"), Ingredient(name: "Pepper", qty: "0.5 tsp"), Ingredient(name: "Parsley", qty: "2 tbsp"), Ingredient(name: "Parmesan cheese", qty: "0.5 cup"), Ingredient(name: "Mozzarella cheese", qty: "1 lb"), Ingredient(name: "Lasagna noodles", qty: "12-15")]

let cubanoIngredients: [Ingredient] = [Ingredient(name: "Boiled ham"), Ingredient(name: "Butter"), Ingredient(name: "Soft baguettes"), Ingredient(name: "Yellow mustard"), Ingredient(name: "Mojo-marinated pork shoulder"), Ingredient(name: "Swiss cheese"), Ingredient(name: "Half-sour dill pickles")]

let recipesData = [Recipe(name: "Shrimp Creole", ingredients: shrimpCreoleIngredients, imageFile: "shrimp_creole.jpg", prepTime: "3 hr 10 min"), Recipe(name: "Lasagna", ingredients: lasagnaIngredients, imageFile: "lasagna.jpg", prepTime: "2 hr 30 min"), Recipe(name: "Cubano", ingredients: cubanoIngredients, imageFile: "cubano.jpg", prepTime: "30 min")]