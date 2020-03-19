//
//  PressureView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 18.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct PressureView: View {
    var pressure:Double
    var body: some View {
        VStack{
            Image(systemName: "speedometer").resizable().scaledToFit().frame(width:25,height:25)
            Text( "\(pressure.tempformat())").font(.footnote)
            Text("mbar").font(.system(size: 10)).foregroundColor(.gray)
        }
    }
}

struct PressureView_Previews: PreviewProvider {
    static var previews: some View {
        PressureView(pressure:8000)
    }
}
