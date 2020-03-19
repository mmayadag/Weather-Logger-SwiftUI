//
//  WeatherIconView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 18.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct WeatherIconView: View {
    let w: Weather
    init(_ w:Weather) {
        self.w = w
    }
    var body: some View {
        VStack{
            WeatherIcons[dynamicMember: w.main ]
                .resizable()
                .scaledToFit()
                .frame(width:50,height: 50)
            Text(w.description)
                .multilineTextAlignment(.center)
        }
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconView( Weather_mock )
    }
}
