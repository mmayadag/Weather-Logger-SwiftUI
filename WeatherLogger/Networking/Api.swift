//
//  Api.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 13.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import Foundation

class Api{
    
    
    func makeRequest(url:URL, completion: @escaping (WeatherData)->() ){
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let responseData = data else { return }
            print(responseData)
            
            let weatherData = try! JSONDecoder().decode(WeatherData.self, from: responseData)
            print(weatherData)
            DispatchQueue.main.async {
                completion(weatherData)
            }
        }.resume()
    }
    
    func getWeatherBy(lat:Double, lon:Double, completion:  @escaping (WeatherData)->() ){
        
        let endpoint  = Endpoint.currentWeatherUrl(lat: lat, lon: lon, ApiKey: ApiKey)
        guard let url = endpoint?.url else { return }
        
        self.makeRequest(url: url , completion: completion)
    }
}
