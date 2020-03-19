//
//  MapkitView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 14.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
//    @ObservedObject var locationViewModel = LocationViewModel()

    @Binding var latitude:Double?
    @Binding var longitude:Double?
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: latitude ?? 0 , longitude: longitude ?? 0)
        print(coordinate)
        uiView.showsUserLocation = true
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: .constant(izmir_coordinate.lat), longitude: .constant(izmir_coordinate.lon))
    }
}
