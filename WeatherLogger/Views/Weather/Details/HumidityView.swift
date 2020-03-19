//
//  HumidityView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 18.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct HumidityView: View {
     var humidity:Double
       var body: some View {
           VStack{
               Image("water").resizable().scaledToFit().frame(width:25,height:25)
               Text( "\(humidity.tempformat())%").font(.footnote)
               Text("humidity").font(.system(size: 10)).foregroundColor(.gray)
           }
       }
}

struct HumidityView_Previews: PreviewProvider {
    static var previews: some View {
        HumidityView(humidity:26)
    }
}
