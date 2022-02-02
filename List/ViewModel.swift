//
//  ViewModel.swift
//  List
//
//  Created by Etienne Vautherin on 02/02/2022.
//

import SwiftUI
import Combine
import CoreLocation
import MapKit


struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    }
}

class ViewModel: ObservableObject {
    @Published var cities: [City]
    @Published var regions: [MKCoordinateRegion]
    
    init() {
        let cities = [
            City(
                name: "London",
                coordinate: CLLocationCoordinate2D(
                    latitude: 51.507222,
                    longitude: -0.1275
                )
            ),
            City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
            City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
            City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
        ]
        
        self.cities = cities
        
//        self.regions = cities.map({
//            $0.region
//        })
        
       self.regions = cities.map(\.region)
    }
}
