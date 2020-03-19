//
//  WeatherLogListView.swift
//  WeatherLogger
//
//  Created by Murat Mayadağ on 17.03.2020.
//  Copyright © 2020 Murat Mayadağ. All rights reserved.
//

import SwiftUI

struct WeatherLogListView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: WeatherLog.entity(), sortDescriptors: [
        NSSortDescriptor(key: "date", ascending: false)] ) var weatherLogs: FetchedResults<WeatherLog>
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(weatherLogs, id:\.id) { weather in
                        HStack{
                            VStack{
                                LocationView(latitude: .constant(weather.lat), longitude: .constant(weather.lon),saved:true)
                                HStack{
                                    //Text("\(weather.id!.uuidString)")
                                    Text("\(self.dateFormatter.string(from: weather.date!))").font(.footnote)
                                }
                            }
                            
                            Text("\(weather.temp.tempformat())°C").font(.headline)
                            
                            if weather.main != nil {
                                WeatherIconView(Weather(id: 1, main: weather.main ?? "", description: weather.main_desc ?? "", icon: ""))
                            }
                        }
                        
                        
                        }
                    .onDelete(perform: delete)
                }
                .navigationBarTitle("Weather Logs")
                .navigationBarItems(trailing: EditButton())

                Text("total records: \(weatherLogs.count)")

            }
        }
    }
    func delete(at offsets: IndexSet){
        for index in offsets {
            let weather = weatherLogs[index]
            moc.delete(weather)
            do {
                try moc.save()
            }catch{
                
            }
        }
    }

}

struct WeatherLogListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherLogListView()
    }
}
