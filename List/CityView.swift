import SwiftUI
import MapKit
import CoreLocation

struct CityView: View {
//    @EnvironmentObject var model: ViewModel
    @ObservedObject var model: ViewModel
    let index: Int
    
    var body: some View {
        let city = model.cities[index]
        let region = model.regions[index]
        
        VStack {
            Text("Ville : \(city.name)")
                    .fontWeight(.bold)
                .padding()
            HStack {
                Text("lat : \(region.center.latitude)")
                    .padding()
                Text("lng : \(region.center.longitude)")
            }
            Map(coordinateRegion: $model.regions[index])
        }
            
    }
}

struct CityView_Previews: PreviewProvider {
    
    static var previews: some View {
        CityView(model: ViewModel(), index: 1)
    }
}
