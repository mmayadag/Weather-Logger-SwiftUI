//
//  SaveButton.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 18.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct SaveButton: View {
    let text:String
    init(_ text:String) {
        self.text = text
    }
    var body: some View {
        Text(text)
            .frame( width:180 ,height:43 )
            .padding(.horizontal)
            .font(.system(size: 12, weight: .bold, design: .default))
            .foregroundColor(.white)
            .background(
                Capsule().foregroundColor( Color("button-primary") )
            )
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SaveButton("Save Button")
        }.previewLayout(.fixed(width: 400, height: 200))

    }
}
