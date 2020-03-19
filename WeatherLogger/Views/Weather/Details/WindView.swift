//
//  WindView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 19.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct WindView: View {
    let wind: Wind
    var body: some View {
        VStack{
            Image(systemName:"location.north.fill")
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: Double(wind.degree ?? 0) ))
                .frame(width:25,height:25)
            if wind.speed != nil {
            Text( "\(wind.speed!.format()) m/s")
                .font(.footnote)
            }
            Text("wind")
                .font(.system(size: 10)).foregroundColor(.gray)
        }
    }
}

struct WindView_Previews: PreviewProvider {
    static var previews: some View {
        WindView(wind:Wind_mock)
    }
}
