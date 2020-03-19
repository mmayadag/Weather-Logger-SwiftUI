//
//  WeatherIcon.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 18.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import Foundation
import SwiftUI

enum WeatherIcon: String , CaseIterable {
    case Ash          = "cloud.hail"
    case Clear        = "sun.max"
    case Clouds       = "cloud.sun.fill"
    case Drizzle      = "cloud.drizzle.fill"
    case Dust         = "sun.dust.fill"
    case Fog          = "cloud.fog.fill"
    case Haze         = "sun.haze.fill"
    case Mist         = "cloud.drizzle"
    case Rain         = "cloud.rain.fill"
    case Sand         = "smoke"
    case Snow         = "cloud.snow.fill"
    case Squall       = "tornado"
    case Thunderstorm = "cloud.bol.fill"
    
    var image: Image {
        return Image(systemName: self.rawValue)
    }
    
    init() {
        self = .Clear
    }
}

@dynamicMemberLookup
struct WeatherIcons{
   static let icons: [String:WeatherIcon] = [
                 "Ash":.Ash,
                 "Clear":.Clear,
                 "Clouds":.Clouds,
                 "Drizzle":.Drizzle,
                 "Dust":.Dust,
                 "Fog":.Fog,
                 "Haze":.Haze,
                 "Mist":.Mist,
                 "Rain":.Rain,
                 "Sand":.Sand,
                 "Snow":.Snow,
                 "Squall":.Squall,
                 "Thunderstorm":.Thunderstorm,
                 ]
    public static subscript(dynamicMember key: String) -> Image {
        get { return WeatherIcons.icons[key]?.image ?? WeatherIcon().image }
    }
  
}

//let icons = WeatherIcons
// print( WeatherIcons[dynamicMember:"Ash"] )

/*
struct GetIcon {
    
    func showWeatherIcon(item: Weather) -> String {
                
                let main = item.main
                
                switch main {
                case "Ash":
                    return "cloud.hail"
                case "Clear":
                    return "sun.max"
                case "Clouds":
                    return "cloud.sun.fill"
                case "Drizzle":
                    return "cloud.drizzle.fill"
                case "Dust":
                    return "sun.dust.fill"
                case "Fog":
                    return "cloud.fog.fill"
                case "Haze":
                    return "sun.haze.fill"
                case "Mist":
                    return "cloud.drizzle"
                case "Rain":
                    return "cloud.rain.fill"
                case "Sand":
                    return "cloud.hail"
                case "Snow":
                    return "cloud.snow.fill"
                case "Squall":
                    return "cloud.hail"
                case "Thunderstorm":
                    return "hurricane"
                    
                default:
                    return "clear"
                }
                
            }
    
    func showWeatherIcon(item: TopLevel) -> String {
            
        let main = (item.list.first?.weather.first?.main)!
            
            switch main {
            case "Ash":
                return "cloud.hail"
            case "Clear":
                return "sun.max"
            case "Clouds":
                return "cloud.sun.fill"
            case "Drizzle":
                return "cloud.drizzle.fill"
            case "Dust":
                return "sun.dust.fill"
            case "Fog":
                return "cloud.fog.fill"
            case "Haze":
                return "sun.haze.fill"
            case "Mist":
                return "cloud.drizzle"
            case "Rain":
                return "cloud.rain.fill"
            case "Sand":
                return "cloud.hail"
            case "Snow":
                return "cloud.snow.fill"
            case "Squall":
                return "cloud.hail"
            case "Thunderstorm":
                return "cloud.bol.fill"
                
            default:
                return "clear"
            }
            
        }
}

*/
