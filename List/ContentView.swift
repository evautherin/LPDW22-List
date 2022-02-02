//
//  ContentView.swift
//  List
//
//  Created by Etienne Vautherin on 02/02/2022.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var model = ViewModel()
    
    var body: some View {
        NavigationView {
            List(model.cities.indices) { index in
                let city = model.cities[index]
                NavigationLink(destination: CityView(model: ViewModel, index: Int)) {
                    HStack {
                        Text("Hello, \(city.name)!")
                            .padding()
        //                Text("Latitude: \(item.coordinate.latitude)!")
        //                    .padding()
                    }
                }
            }
        }
    }
    .environmentObject(model)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
