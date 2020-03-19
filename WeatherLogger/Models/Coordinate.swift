//
//  Coordinate.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 13.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import Foundation

struct Coordinate {
    let lat: Double
    let lon: Double

    func destructuring()->(Double,Double){
        return(self.lat,self.lon)
    }
}
