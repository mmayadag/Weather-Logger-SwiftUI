//
//  TemperatureView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 16.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct TemperatureView: View {
    @Binding var data:Main?
    //var units: Units = .metric
    var body: some View {
        VStack(spacing:2){
            if data != nil {
                
                HStack(alignment: .lastTextBaseline){
                    Text("Temp").foregroundColor(.gray)
                    Text("\( data!.temp.tempformat())°").font(.system(size: 60))
                        
                    VStack(spacing:1){
                        Text("C")
                        Text("K").foregroundColor(.gray)
                    }.font(.system(size:22))
                }.padding().frame(minWidth: 200)
                    .border( Color.gray.opacity(0.2) , width: 1)
                
                HStack{
                        HStack{
                            Image(systemName: "arrow.up.to.line.alt")
                            Text("\(data!.temp_max.tempformat())")
                        }.frame(width: 40)
                            .padding([.horizontal],10).padding(.vertical,5)
                            .border( Color.gray.opacity(0.2) , width: 1)
                    Image(systemName: "thermometer").frame(width:60)
                        HStack{
                            Text("\(data!.temp_min.tempformat())")
                            Image(systemName: "arrow.down.to.line.alt")
                        }.frame(width: 40).padding([.horizontal],10).padding(.vertical,5)
                        .border( Color.gray.opacity(0.2) , width: 1)

                   

                }.font(.footnote).frame(minWidth: 200)
            }
        }
    }
}




struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(data: .constant(temperator_izmir))
    }
}
