//
//  ReloadButton.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 19.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct ReloadButton: View {
    var small:Bool = false
    var body: some View {
        HStack{
            Image(systemName: "arrow.2.circlepath")
            if !small{ Text("Reload") }
        }
        .frame( width:small ? 20 : 180 ,height:43 )
        .padding(.horizontal)
        .font(.system(size: 12, weight: .bold, design: .default))
        .foregroundColor(Color("button-primary") )
        .background(
            Capsule().foregroundColor( .white ).shadow(radius: 10)
        )
    }
}

struct ReloadButton_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ReloadButton()
            ReloadButton(small:true)
        }
    }
}
