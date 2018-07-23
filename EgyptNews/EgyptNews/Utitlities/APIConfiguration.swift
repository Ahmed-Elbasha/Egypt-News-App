//
//  APIConfiguration.swift
//  EgyptNews
//
//  Created by Ahmed Elbasha on 7/23/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation

// We're Storing API Key Here.
let apiKey = "fee9c999a5064459a9f4954ab9b7a020"
// We're Storing country code here.
let country = "eg"

func getApiRequestUrl(forApiKey apiKey: String, withCountry country: String, withCategory category: String) -> String {
    let apiRequestUrl = "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&apiKey=\(apiKey)"
    return apiRequestUrl
}

