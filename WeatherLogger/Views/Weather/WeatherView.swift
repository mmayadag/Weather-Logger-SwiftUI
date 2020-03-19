//
//  WeatherView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 16.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var locationViewModel = LocationViewModel()
    @State var currentWeather: WeatherData?
    @State var alertDisplay:Bool = false

    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    
    var body: some View {
        VStack{
            
            MapView(
                latitude: .constant(self.locationViewModel.userLatitude),
                longitude: .constant(self.locationViewModel.userLongitude)
            ).frame(height: width > 400 ? 300 : 220)
            
            
            LocationView(
                latitude: .constant(self.locationViewModel.userLatitude),
                longitude: .constant(self.locationViewModel.userLongitude)
            )
           

            if currentWeather?.name != nil{
                HStack(spacing: 40){
                    TemperatureView(data: .constant(currentWeather?.main) )
                    
                    VStack{
                        Text(currentWeather!.name )
                        ForEach(currentWeather!.weather, id:\.id){ weather in
                                WeatherIconView(weather)
                        }
                    }
                }.padding()
                
                HStack(spacing: 40){
                    
                    PressureView(pressure: currentWeather!.main.pressure)
                    HumidityView(humidity: currentWeather!.main.humidity)
                    if currentWeather?.visibility != nil {
                        VisibilityView(visibility: currentWeather!.visibility!)
                    }
                    WindView(wind:currentWeather!.wind)
                }
                .padding()
               
                Spacer()
                if height > 667 {
                    RefreshButton(small:false)
                    SaveInfoButton()
                }else{
                    HStack{
                        RefreshButton(small: true)
                        SaveInfoButton()
                    }
                        
                }
                
                Spacer()
            }else{
                Spacer()
                Text("Loading...").onTapGesture {
                    self.getCurrentWeather()
                }
                Spacer()
            }
            
            
            if locationViewModel.userLatitude != nil && locationViewModel.userLongitude != nil {
                 Divider().onAppear{
                    self.getCurrentWeather()
                    
                 }
            }
        }.onAppear(){
            self.getCurrentWeather()
        }
    }
    
    
    func saveCurrentData(){
        guard let cw = self.currentWeather else{
             return
         }

         let newWeather      = WeatherLog(context: self.moc)
             newWeather.id   = UUID()
             newWeather.lat  = cw.coord.lat
             newWeather.lon  = cw.coord.lon
             newWeather.date = Date()
             newWeather.temp = cw.main.temp
             newWeather.humidity = cw.main.humidity
             newWeather.city = cw.name
         
         if let first = cw.weather.first {
             newWeather.main      = first.main
             newWeather.main_desc = first.description
         }
         
         do {
             try self.moc.save()
             self.alertDisplay.toggle()
             print("ok")
         }catch {
             print("Unable to Save Managed Object Context")
             print("\(error), \(error.localizedDescription)")
         }
         print(newWeather)
    }
    
    func SaveInfoButton() -> some View {
        Button(action: {
            self.saveCurrentData()
        }) {
            SaveButton("Save Current Weather Info")
        }.alert(isPresented: $alertDisplay) {
            Alert(title: Text("Saved"),
                  message: Text("Weather Forecast information Saved"),
                  dismissButton: .default( Text("Close") )
            )
        }
    }
    func RefreshButton(small:Bool)-> some View{
        Button(action: {
            self.locationViewModel.start()
            self.getCurrentWeather()
        }){
            ReloadButton(small:small)
        }
    }
    
    func getCurrentWeather(){
        
        self.currentWeather = nil
        
        //let (lat,lon) = izmir_coordinate.destructuring()
        guard let lat = locationViewModel.userLatitude ,
              let lon = locationViewModel.userLongitude else {
              return
        }

        Api().getWeatherBy(lat: lat, lon: lon, completion:{ data in
            self.currentWeather = data
            self.locationViewModel.stop()
        } )
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
