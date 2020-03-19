//
//  VisibilityView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 18.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct VisibilityView: View {
     var visibility:Double
          var body: some View {
              VStack{
                Image(systemName:"eye").resizable().scaledToFit().frame(width:25,height:25)
                Text( "\(visibility.visibiltyFormat())km").font(.footnote)
                Text("visibility").font(.system(size: 10)).foregroundColor(.gray)
              }
          }
}

struct VisibilityView_Previews: PreviewProvider {
    static var previews: some View {
        VisibilityView(visibility:10000)
    }
}

