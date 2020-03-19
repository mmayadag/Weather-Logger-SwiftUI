//
//  WeatherData.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 13.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import Foundation

// MARK: - Enumeration for Units
enum Units: String{
    case metrics = "metrics"
    case kelvin  = "kelvin"
}

// MARK: - Main Forecast Data
struct Main: Codable {
    let temp , feels_like ,temp_min ,temp_max , pressure , humidity : Double
}

// MARK: - Weather description & icon
struct Weather: Codable{
    let id : Int
    let main, description, icon : String
}
// MARK: - Wind speed and degree
struct Wind: Codable{
    let speed: Double?
    //let deg : Int?
    let degree:Int?
    let gust: Double?
    
    /// Example  key rename
     enum CodingKeys: String, CodingKey {
        case speed
        case degree = "deg"
        case gust
     }
    
}
// MARK: - City Sunrise & Sunset
struct Sys: Codable{
    let type, id ,sunrise , sunset: Int?
    let country: String
}

// MARK: - Coordinates
struct Coord: Codable{
    let lon ,lat: Double
}

// MARK: - RootLevel
struct WeatherData: Codable, Identifiable {
    let id, cod, timezone : Int
    let name , base : String
    let weather: [Weather]
    let main: Main // this is important main temp data
    let visibility: Double?
    let wind: Wind
    let sys: Sys
    let coord: Coord
    
    
}
