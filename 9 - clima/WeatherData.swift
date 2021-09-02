//
//  WeatherData.swift
//  Clima
//
//  Created by Virtual Machine on 02/09/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
}

struct Main: Decodable {
    let temp: Double
}
