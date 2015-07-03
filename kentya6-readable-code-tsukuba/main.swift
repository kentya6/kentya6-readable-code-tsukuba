//
//  main.swift
//  kentya6-readable-code-tsukuba
//
//  Created by Kengo Yokoyama on 2015/06/30.
//  Copyright (c) 2015年 Kengo Yokoyama. All rights reserved.
//

import Foundation

// MARK: - constants

// recipe absolute file path.
let kRecipeFilePath = "/Users/Ken/Desktop/kentya6-readable-code-tsukuba/kentya6-readable-code-tsukuba/"

// default recipe list.
let kDefaultUseRecipes = ["Ken", "Tera", "Using", "BL"]


// MARK: - function

/**
show recipe information.

:param: users user's recipe file name array. If you set to nil, all of user recipes file are loaded.
:param: userId show recipe by user id. If you set to nil, all of user id are enumerated.
:param: recipeId show recipe by recipe id. If you set to nil, all of recipe id are enumerated.
*/
private func showRecipe(#users: [String]?, #userId: Int?, #recipeId: Int?) {
    var lineNumber = 1
    
    if let users = users {
        for (index, user) in enumerate(users) {
            println("User: \(index): \(user)")
            if let content = String(contentsOfFile: kRecipeFilePath + "/\(user)Recipe.txt", encoding: NSUTF8StringEncoding, error: nil) {
                content.enumerateLines({
                    (recipeInfo: String, inout stop: Bool) -> Void in
                    if let userId = userId, recipeId = recipeId {
                        if index == userId && recipeId == lineNumber {
                            println("Recipe ID: \(lineNumber): \(recipeInfo)")
                        }
                    } else if let userId = userId {
                        if index == userId {
                            println("Recipe ID: \(lineNumber): \(recipeInfo)")
                        }
                    } else if let recipeId = recipeId {
                        if recipeId == lineNumber {
                            println("Recipe ID: \(lineNumber): \(recipeInfo)")
                        }
                    } else {
                        println("Recipe ID: \(lineNumber): \(recipeInfo)")
                    }
                    lineNumber++
                })
            } else {
                println("User recipe file can't find.")
            }
        }
    } else {
        for (index, user) in enumerate(kDefaultUseRecipes) {
            println("User: \(index): \(user)")
            if let content = String(contentsOfFile: kRecipeFilePath + "/\(user)Recipe.txt", encoding: NSUTF8StringEncoding, error: nil) {
                content.enumerateLines({
                    (recipeInfo: String, inout stop: Bool) -> Void in
                    println("Recipe ID: \(lineNumber): \(recipeInfo)")
                    lineNumber++
                })
            }
        }
    }
}

// MARK: - example usages

showRecipe(users: nil, userId: nil, recipeId: nil)

//showRecipe(users: ["Ken"], userId: 0, recipeId: nil)

//showRecipe(users: ["Ken"], userId: nil, recipeId: nil)

//showRecipe(users: ["Ken", "BL"], userId: nil, recipeId: nil)

//showRecipe(users: ["Ken", "BL"], userId: 0, recipeId: nil)

//showRecipe(users: ["Ken", "BL"], userId: 0, recipeId: 1)

//showRecipe(users: ["Tera", "Ken", "BL"], userId: 0, recipeId: 2)

//showRecipe(users: ["Tera", "Ken", "BL"], userId: nil, recipeId: 1)

//showRecipe(users: ["Tera", "Ken2", "BL"], userId: nil, recipeId: 1)
