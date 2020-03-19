//
//  RootView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 16.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State var selection: Int = 1
    var body: some View {
        TabView(selection: $selection) {
            
            WeatherView().tabItem {
                    Image(systemName: "thermometer")
                    Text("Weather")
            }.tag(1)
            
            WeatherLogListView().tabItem {
                Image(systemName: "recordingtape")
                Text("Records")
            }.tag(2)
                
        }
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}


