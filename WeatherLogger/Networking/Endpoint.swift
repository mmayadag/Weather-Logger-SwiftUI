//
//  Endpoint.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 17.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import Foundation

typealias qs = URLQueryItem

struct Endpoint {
    let host = "api.openweathermap.org"
    let scheme = "https"
    let path: String
    let queryItems: [URLQueryItem]

    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        return components.url
    }
    
    static func currentWeatherUrl(lat:Double , lon:Double, ApiKey:String)-> Endpoint?{
        return self.init(
                   path: "/data/2.5/weather",
                   queryItems: [
                       qs(name: "lat", value: "\(lat)"),
                       qs(name: "lon", value: "\(lon)"),
                       qs(name: "appid", value: ApiKey),
                       qs(name: "units", value: "metric"),
                       qs(name: "lang", value: "en")
                   ]
               )
    }
}
