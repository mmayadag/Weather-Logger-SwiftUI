//
//  LocationView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 16.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    //@ObservedObject var locationViewModel = LocationViewModel()
    @Binding var latitude: Double?
    @Binding var longitude: Double?
    
    
    var saved: Bool = false
    var body: some View {
        HStack{
            Text((saved == true ? "" :"Your location is : " ) + "📍")
            VStack{
               Text("Latitude: \(latitude ?? 0)")
               Text("Longitude: \(longitude ?? 0)")
            }
        }.font(.footnote)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(
            latitude: .constant(izmir_coordinate.lat),
            longitude: .constant(izmir_coordinate.lon)
        )
    }
}
