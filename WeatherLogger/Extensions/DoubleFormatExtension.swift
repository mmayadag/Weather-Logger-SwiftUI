//
//  DoubleFormatExtension.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 16.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import Foundation

extension Double{
    func format() -> String {
        return TempConverter(value: self).formatted()
    }
    
}

//without objective-C extension
extension Double{
    func tempformat() -> String{
        return String(format: "%.0f", self)
    }
    func visibiltyFormat() -> String{
       return String(format: "%.0f", self/1000)
    }
}

